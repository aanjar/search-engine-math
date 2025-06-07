import numpy as np
import mysql.connector

def get_adjacency_matrix():
    conn = mysql.connector.connect(
        host='localhost',
        user='root',
        password='',  # ganti jika password MySQL kamu berbeda
        database='scrap'
    )
    cursor = conn.cursor()
    cursor.execute("SELECT id FROM crawler ORDER BY id")
    nodes = [row[0] for row in cursor.fetchall()]
    node_index = {node: idx for idx, node in enumerate(nodes)}
    N = len(nodes)
    adj = np.zeros((N, N))
    cursor.execute("SELECT from_node, to_node FROM hyperlink")
    for from_node, to_node in cursor.fetchall():
        if from_node in node_index and to_node in node_index:
            i = node_index[from_node]
            j = node_index[to_node]
            adj[i, j] = 1
    cursor.close()
    conn.close()
    return adj, nodes

def pagerank(adj, d=0.85, max_iter=100, tol=1e-6):
    N = adj.shape[0]
    out_degree = adj.sum(axis=1)
    M = np.zeros_like(adj)
    for i in range(N):
        if out_degree[i] > 0:
            M[i] = adj[i] / out_degree[i]
        else:
            M[i] = 1.0 / N  # handle dangling node
    M = M.T
    pr = np.ones(N) / N
    for _ in range(max_iter):
        pr_new = (1 - d) / N + d * M @ pr
        if np.linalg.norm(pr_new - pr, 1) < tol:
            break
        pr = pr_new
    return pr

def get_pagerank_scores():
    adj, nodes = get_adjacency_matrix()
    pr = pagerank(adj)
    return dict(zip(nodes, pr))

if __name__ == "__main__":
    scores = get_pagerank_scores()
    for node, score in scores.items():
        print(f"Page {node}: {score:.4f}")
