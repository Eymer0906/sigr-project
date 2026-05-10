# Changelog

Todos los cambios notables de este proyecto se documentan en este archivo.

El formato sigue las recomendaciones de [Keep a Changelog](https://keepachangelog.com/es-ES/1.0.0/)
y este proyecto adhiere a [Semantic Versioning](https://semver.org/lang/es/).

---

## [1.0.0] - 2026-05-10

### Línea Base Inicial del SIGR

Esta versión establece la primera línea base del Sistema Integral de Gestión de Restaurante (SIGR), consolidando los módulos fundamentales para la operación del restaurante.

#### Agregado

- **Módulo de autenticación de usuarios**
  - Registro e inicio de sesión con credenciales.
  - Control de acceso basado en roles (RBAC): cliente, mesero, administrador.
  - Gestión de sesiones y validación de permisos.

- **Módulo de menú digital**
  - Operaciones CRUD para platos y categorías.
  - Clasificación de platos por tipo (entradas, platos fuertes, postres, bebidas).
  - Visualización pública del menú para consulta de clientes.

- **Módulo de registro y seguimiento de pedidos**
  - Creación de órdenes por mesa con selección de platos.
  - Estados del pedido: pendiente, en preparación, listo, servido, cancelado.
  - Notificaciones automáticas al mesero cuando el pedido está listo.

- **Módulo de reservas**
  - Programación de mesas por fecha y hora.
  - Gestión de disponibilidad y asignación automática.
  - Estados de reserva: pendiente, confirmada, cancelada, completada.

- **Módulo de cierre de caja y reportes**
  - Consolidación diaria de ingresos y egresos.
  - Generación de reportes de ventas diarias.
  - Exportación de datos en formatos PDF y Excel.

- **Documentación técnica**
  - `README.md`: instrucciones de instalación y ejecución.
  - `CHANGELOG.md`: historial de cambios del proyecto.
  - `LICENSE.txt`: licencia MIT.
  - `schema.png`: diagrama entidad-relación de la base de datos.
  - `SIGR.sql`: script de creación de tablas en MySQL.
  - `deployment-guide.md`: manual de despliegue del sistema.

- **Infraestructura de versionado**
  - Repositorio Git inicializado con rama principal `main`.
  - Estrategia de ramas basada en Git Flow.
  - Convenciones de commits con prefijos estandarizados.

#### Seguridad

- Implementación de control de acceso basado en roles (RBAC).
- Encriptación de contraseñas de usuarios.
- Validación de sesiones activas.

---

## [Unreleased]

### Planeado para versiones futuras

- Integración continua con GitHub Actions.
- Panel de administración avanzado con estadísticas en tiempo real.
- Sistema de notificaciones por correo electrónico.
- Aplicación móvil complementaria para clientes.
- Soporte para múltiples sucursales.

---

## Guía de Versionado

| Tipo de cambio | Incremento | Ejemplo |
|----------------|------------|---------|
| Corrección de errores (patch) | `x.x.1` | `1.0.0` → `1.0.1` |
| Nueva funcionalidad (minor) | `x.1.0` | `1.0.0` → `1.1.0` |
| Cambio incompatible (major) | `2.0.0` | `1.x.x` → `2.0.0` |

---

Repositorio oficial: [https://github.com/Eymer0906/sigr-project.git](https://github.com/Eymer0906/sigr-project.git)