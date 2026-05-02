# wakir-labs/infra — Meta Repository

Container images, sandbox setup scripts, and ops glue for Wakir Labs.

## What lives where (today)

The ops material currently lives **inside** the AI-Corp governance
repo, because the toolbox/Silverblue setup is tightly coupled to the
host that runs the agent sessions. Moving it to a public repo without
careful sanitization would either leak host paths or break the running
setup.

| Asset | Current location (governance repo) | Future home in `wakir-labs/infra` |
|---|---|---|
| Containerfile.mira | `infra/containers/Containerfile.mira` | `containers/mira/Containerfile` |
| Containerfile.cfo | `infra/containers/Containerfile.cfo` | `containers/cfo/Containerfile` |
| Containerfile.comms | `infra/containers/Containerfile.comms` | `containers/comms/Containerfile` |
| Containerfile.dev-engineering | `infra/containers/Containerfile.dev-engineering` | `containers/dev-engineering/Containerfile` |
| Containerfile.internal-audit | `infra/containers/Containerfile.internal-audit` | `containers/internal-audit/Containerfile` |
| Sandbox setup applier | `agents-workspaces/dev-engineering/sandbox-setup/` | `sandbox-setup/` |
| Systemd timers (audit) | `scripts/systemd/` | `ops/systemd/` |
| OTS / GPG glue | `scripts/setup-gpg.sh`, `scripts/ots-upgrade.sh`, `scripts/git-hooks/` | `ops/audit-trail/` |

## Migration status

Not done. This repo is created early to reserve the slug and to give
the rest of the org a stable target to link to.

## Migration plan (no file moves yet)

1. **Sanitize.** Remove host paths (`/var/home/fred/...`) and
   AI-Corp-specific env names from Containerfiles. Replace with a
   `WAKIR_HOME` style indirection.
2. **Decouple from governance repo.** The sandbox-setup applier today
   reads the AI-Corp tree directly. It should instead consume a
   well-defined config file the user provides.
3. **Open-source review.** Apache 2.0 headers; no secrets, no GPG
   private keys, no `.env` files in history.
4. **Cut over.** Single PR that imports the sanitized tree as the
   first non-stub commit. The governance repo retains a thin shim
   pointing at this repo.

## What this skeleton ships today

Just this README. The first non-stub PR follows the plan above.

## License (when content lands)

Apache 2.0.
