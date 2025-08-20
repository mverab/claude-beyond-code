# Claude-Beyond-Code

Una biblioteca curada de Estilos de Salida que transforman Claude Code en agentes especializados para roles no técnicos, manteniendo sus capacidades locales (leer/escribir archivos, ejecutar scripts, TODOs).

## ¿Por qué Estilos de Salida?
- Los Estilos de Salida reemplazan el prompt del sistema por defecto y convierten a Claude en un agente distinto con sus propias reglas y formato.
- Combínalos con Comandos Slash, Subagentes y Hooks para flujos listos para usar.

## Estilos Incluidos (MVP)
- 🖥️ html-terminal: Produce solo HTML estilo terminal retro con reglas estrictas de formato y guardado.
- 📝 docs-writer: Especialista en documentación técnica con plantillas (README, ADR) y reglas de redacción.
- 🚨 sre-incident-scribe: Registrador de incidentes con actualizaciones cronológicas y postmortems estructurados.

## Inicio Rápido
1) Instalación a nivel de proyecto (recomendado)
```bash
cp -r path/to/claude-beyond-code/.claude .
```
2) Activa un estilo
```
/output-style html-terminal
/output-style docs-writer
/output-style sre-incident-scribe
```
3) Usa los comandos del estilo
```
/docs:readme
/sre:triage "Fallas de conexión a la base de datos"
/sre:update "Se aplicó el hotfix v2.1.1"
```

## Subagentes (opcionales, alineados al MVP)
Los subagentes del proyecto viven en `.claude/agents/`. Claude puede delegarles automáticamente o puedes invocarlos explícitamente (usa la UI "/agents" o pide "Usa el subagente X …").

- 🔎 log-slicer (SRE)
  - Herramientas: Read, Grep, Glob
  - Uso: Segmentar y resumir logs grandes durante incidentes. Devuelve hallazgos, evidencia, métricas y próximos pasos.
  - Ejemplo: "Usa el subagente log-slicer para analizar logs en logs/ buscando patrones de 'timeout'".

- 📎 snippet-extractor (Docs)
  - Herramientas: Read, Grep
  - Uso: Extraer fragmentos de código con contexto (ruta/lenguaje) para enriquecer READMEs/ADRs.
  - Ejemplo: "Pide a snippet-extractor que obtenga ejemplos de uso de la API Foo desde src/".

- 💾 html-saver (HTML Terminal)
  - Herramientas: Write
  - Uso: Guardar HTML producido por `html-terminal` como `terminal_output_[nombre]_[YYYYMMDD_HHMMSS].html`.
  - Ejemplo: "Pide a html-saver que guarde la última respuesta HTML como archivo de vista previa".

> Nota: Subagentes con permisos mínimos para mantener seguro el MVP.

## Estructura del Repositorio

### Actual (MVP)
```
.claude/
- output-styles/
  - html-terminal.md
  - docs-writer.md
  - sre-incident-scribe.md
- agents/
  - log-slicer.md
  - snippet-extractor.md
  - html-saver.md
- commands/
  - docs-readme.md
  - sre-triage.md
  - sre-update.md
- examples/
  - docs-writer-example.md
  - sre-scribe-example.md
  - log-slicer-example.md
  - snippet-extractor-example.md
  - html-saver-example.md
- recipes/
  - sre-quick-playbook.md
```

### Referencia (extendido desde `skeleton.md`)
```
/styles         # Estilos por categoría con README, ejemplos, notas
/commands       # Plantillas de comandos slash por estilo
/agents         # Subagentes opcionales para delegación
/hooks          # Hooks de validación/seguridad (p.ej., bloquear escrituras en estilos consultivos)
/recipes        # Playbooks (estilo + comandos + agentes + hooks)
/evals          # Chequeos deterministas (markdown de esquema, diff unificado, etc.)
/examples       # Demos end-to-end por estilo
.claude/output-styles  # Plantillas a nivel de proyecto
.claude/commands       # Comandos a nivel de proyecto
.claude/examples       # Ejemplos a nivel de proyecto
.claude/recipes        # Recetas a nivel de proyecto
```

## Principios
- Simplicidad y seguridad (mínimos privilegios).
- Claridad sobre complejidad.
- Los estilos transforman el comportamiento; comandos y subagentes lo operacionalizan.

## Hoja de Ruta Corta
- Hooks mínimos: bloquear Escritura en estilos consultivos; validador de diffs para estilos de seguridad.
- Recetas de flujo (redacción de incidentes, ADR rápido).
- Evals ligeros y CI para validar formatos.

## Sistema SEO opcional (Agent-first)
 El pack SEO vive en `systems/seo/` para mantener `.claude/` limpio. Es opt-in y prioriza subagentes sobre slash commands. Instala desde la terminal:
 
 - Copia a nivel de proyecto (recomendado)
 ```bash
 chmod +x systems/seo/install.sh
 ./systems/seo/install.sh --project --copy --all
 ```
 
 - Symlinks a nivel de usuario (perfil local)
 ```bash
 ./systems/seo/install.sh --user --symlink --agents --styles
 ```
 
 - Mínimo agent-first (solo agentes y estilos)
 ```bash
 ./systems/seo/install.sh --project --copy --agents --styles
 ```
 
 Uso tras la instalación:
 - Cambia el estilo: `/output-style seo-strategist`
 - Subagentes: `/agents brief-architect`, `/agents keyword-clusterer`, `/agents optimizer`, `/agents refresh-auditor`, `/agents cluster-planner`, `/agents gap-analyst`, `/agents serp-analyst`, `/agents entity-clusterer`, `/agents internal-linker`
 - Los comandos son wrappers opcionales si instalas `systems/seo/commands/`
 
 Seguridad: todos los agentes son consultivos por defecto (Markdown/diffs primero). Los hooks existentes pueden bloquear escrituras salvo aprobación explícita.
 
 Desinstalar: elimina copias/enlaces bajo `.claude/`.

## Contribuir
Abre un issue con el estilo/subagente propuesto, propósito claro y dos ejemplos de uso. Ver `CONTRIBUTING.md`.
