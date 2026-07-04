# GrandBank

Laravel-based online banking platform with user dashboards, admin panel, deposits/withdrawals, virtual cards, investment plans, and crypto features.

## Database

The `database/` folder contains the current schema snapshot and ER diagrams for the `bank` MySQL database.

| File | Description |
|------|-------------|
| [`database/bank_2026-07-04.sql`](database/bank_2026-07-04.sql) | Full SQL dump (structure + data, 39 tables) |
| [`database/ER-DIAGRAM.md`](database/ER-DIAGRAM.md) | Entity-relationship diagrams in Mermaid (renders on GitHub and in Cursor) |
| [`database/schema.dbml`](database/schema.dbml) | DBML schema for [dbdiagram.io](https://dbdiagram.io) — import for an interactive, exportable diagram |

### Viewing the ER diagrams

- **GitHub / Cursor:** Open [`database/ER-DIAGRAM.md`](database/ER-DIAGRAM.md). Mermaid blocks render automatically.
- **dbdiagram.io:** Copy the contents of [`database/schema.dbml`](database/schema.dbml) into the editor, or import the file directly.

### Restore the database

```bash
mysql -u root bank < database/bank_2026-07-04.sql
```

Or import `database/bank_2026-07-04.sql` via phpMyAdmin.

### Migrations

Schema changes are managed through Laravel migrations in [`database/migrations/`](database/migrations/).

## Tech stack

- PHP / Laravel
- MySQL (MariaDB)
- Laravel Mix, Tailwind CSS, Alpine.js (user dashboard assets)

## License

The Laravel framework is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
