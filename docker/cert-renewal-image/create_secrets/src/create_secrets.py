from kubernetes import client, config

config.load_incluster_config()

v1 = client.CoreV1Api()
secrets = v1.list_namespaced_secret("app")
for s in secrets.items:  # .items is the list
    print(f"Secret Name: '{s.metadata.name}'")
