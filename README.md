# CombatPets-spigot

## Build profiles

Use these commands in local builds and CI depending on whether NMS bridge classes and private integrations are required:

- **Baseline/public build** (public modules only):
  - `mvn clean install`
- **Plugin compile with NMS bridges**:
  - `mvn clean install -Pspigot-remapped`
- **Plugin compile + private integrations**:
  - `mvn clean install -Pspigot-remapped,optional-integrations`

> **Important:** `Core` imports NMS bridge classes directly, so `spigot-remapped` is required for a full plugin compile.

### CI guidance

- Keep public/default CI on `mvn clean install` so baseline modules remain buildable without private integrations.
- Use `-Pspigot-remapped` in CI jobs that compile the full plugin, because `Core` has direct imports of remapped NMS bridge classes.
- Add `optional-integrations` only in private/self-hosted CI environments that have access to those artifacts.
