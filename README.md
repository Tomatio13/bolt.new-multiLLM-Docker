# bolt.new-multiLLM-Docker

This project is designed to run the [bolt.new-multLLM](https://github.com/Tomatio13/bolt.new-multiLLM), which is forked from [bolt.new](https://github.com/stackblitz/bolt.new), in a Docker container.

Usage:

1. Execute the following command:
```bash
git clone https://github.com/Tomatio13/bolt.new-multiLLM-Docker.git
```

2. Modify the definitions in "env.local.docker".
```
ANTHROPIC_API_KEY=<YOUR ANTHROPIC API KEY>
OPENAI_API_KEY=<YOUR OPENAI API KEY>
OLLAMA_BASE_URL=http://host.docker.internal:11434/v1/
VITE_LOG_LEVEL=debug
```

3. Modify the definitions in "llms.json".
```json
[
[
    {
        "provider": "anthropic",
        "model": "claude-3-5-sonnet-20240620",
        "capt": "Claude 3.5"
    },
    {
        "provider": "openai",
        "model": "gpt-4o",
        "capt": "OpenAI GPT-4o"
    },
    {
        "provider": "ollama",
        "model": "qwen2.5-coder-128k",
        "capt": "qwen2.5-coder"
    },
    {
        "provider": "ollama",
        "model": "7shi/ezo-gemma-2-jpn:2b-instruct-q8_0",
        "capt": "ezo-gemma-2-jpn"
    }
]
]
```
1. Execute the following command to build:
```bash
docker compose build
```

1. Execute the following command to launch bolt.new:
```bash
docker compose up -d 
```
1. Access the following address from your browser:
 http://localhost:8788

---
If you make changes to "llms.json," please rebuild it before running.
```bash
docker compose build
docker compose up -d 
```

---
Notes: 

This container uses Nginx as described below: 
```
Host PC : 8788 -->> Nginx : 80 -->> bolt.new:8788
```
To change the port number exposed to the host PC, modify docker-compose.yml.