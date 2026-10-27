# Reglas globales

Aplican en cualquier repositorio y en cualquier directorio. Las reglas de un proyecto se suman a estas; no las anulan.

## Gestor de paquetes de Node: pnpm

- **Nunca se ejecuta `npm` ni `npx`.** Se usa `pnpm` en su lugar, también en scripts, instrucciones y documentación que se escriban.
- Equivalencias: `npm install` → `pnpm install`; `npm install <paquete>` → `pnpm add <paquete>`; `npm install -g <paquete>` → `pnpm add -g <paquete>`; `npm ci` → `pnpm install --frozen-lockfile`; `npm run <script>` → `pnpm run <script>`; `npx <paquete>` → `pnpm dlx <paquete>`; un binario ya instalado en el proyecto → `pnpm exec <binario>`.
- Si un proyecto solo trae `package-lock.json`, no se ejecuta `npm` para respetarlo: se avisa al usuario y él decide.
- La regla se hace cumplir fuera del contexto: `~/.claude/settings.json` deniega `Bash(npm *)` y `Bash(npx *)`, y `~/.zshrc` define funciones `npm` y `npx` que no ejecutan nada y muestran el equivalente.
