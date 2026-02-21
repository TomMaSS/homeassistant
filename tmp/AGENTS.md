# AGENTS.md — Temporary / Utility Scripts

## Purpose

Temporary files, utility scripts, and development tools. Not part of the core Home Assistant configuration.

## Key Files

| File | Purpose |
|------|---------|
| `claude_init.sh` | Claude Code initialization script — sets up HA MCP server with token from env var or user input |

## Conventions

- Scripts should be self-documented with comments
- Use environment variables or user prompts for sensitive data (tokens, passwords)
- This directory is for tooling and setup — not for HA configuration files

## Constraints

- Files here are NOT loaded by Home Assistant
- Do NOT store secrets or tokens in committed files
