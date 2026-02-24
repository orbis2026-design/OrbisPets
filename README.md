# CombatPets-spigot

## Build profiles

Use these commands in local builds and CI depending on whether NMS bridge classes are required:

- **Baseline/public build** (default modules only, no private integrations):
  - `mvn clean install`
- **Remapped NMS/Core compile path** (includes NMS bridge classes):
  - `mvn clean install -Pspigot-remapped`
- **Remapped NMS + private integrations** (for environments with private/local integration artifacts):
  - `mvn clean install -Pspigot-remapped,optional-integrations`

### CI guidance

- Keep public/default CI on `mvn clean install` so baseline modules remain buildable without private integrations.
- Use `-Pspigot-remapped` in CI jobs that compile Core with remapped NMS bridge dependencies.
- Add `optional-integrations` only in private/self-hosted CI environments that have access to those artifacts.
