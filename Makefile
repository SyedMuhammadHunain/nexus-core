.PHONY: install dev run lint eval deploy

# Install all project dependencies (runs uv sync)
install:
	agents-cli install

# Start the interactive web playground for the agent
dev:
	agents-cli playground

# Run the agent from the CLI (Example: make run PROMPT="Hello!")
run:
	@if [ -z "$(PROMPT)" ]; then \
		echo "Usage: make run PROMPT='your prompt here'"; \
		exit 1; \
	fi
	agents-cli run "$(PROMPT)"

# Lint and auto-fix code, plus type-checking
lint:
	agents-cli lint --fix
	agents-cli lint --mypy

# Run end-to-end evaluation (generate traces + grade)
eval:
	agents-cli eval run

# Deploy the agent to the configured cloud target
deploy:
	agents-cli deploy
