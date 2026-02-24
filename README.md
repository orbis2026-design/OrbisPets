# CombatPets-spigot

## Build Requirements
- Java 21
- Maven 3.9+
- Local Spigot BuildTools outputs for remapped artifacts used by NMS bridge modules

## Project Build Profiles
This repository builds in two layers:

1. **Baseline modules** (`API`, `NMS`, `Core` dependencies only)
2. **Versioned NMS bridge modules** (`MC_1_21_4`, `MC_1_21_5`, `MC_1_21_8`, `MC_1_21_10`) behind the `spigot-remapped` profile

Optional private integrations (`FreeMinecraftModels`, `LevelledMobs`) are behind `optional-integrations`.

## Commands
- Baseline sanity build:
  - `mvn clean install`
- Full plugin build with NMS bridges:
  - `mvn -U clean install -Pspigot-remapped`
- Full plugin build + optional private integrations:
  - `mvn -U clean install -Pspigot-remapped,optional-integrations`

## If your local fork has `MC_1_21_11`
The upstream repo currently does not ship `MC_1_21_11`. If your local branch added it and build fails on
`org.spigotmc:spigot:...:remapped-mojang:1.21.11-R0.1-SNAPSHOT`, use one of these paths:

1. Remove `MC_1_21_11` from your local reactor/profile wiring (Option A), then build with current upstream modules.
2. Keep `MC_1_21_11` only if your local Maven repository contains matching remapped artifacts for 1.21.11 and all POM/profile wiring is consistent.

## Notes
- Protocol translation plugins (ViaVersion / ViaBackwards / ViaRewind) do not provide compile-time NMS artifacts.
- NMS bridge compilation depends on remapped Spigot artifacts expected by the versioned NMS modules.
