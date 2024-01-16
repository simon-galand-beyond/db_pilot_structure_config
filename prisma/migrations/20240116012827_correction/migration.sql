/*
  Warnings:

  - You are about to drop the column `voile_id` on the `StaticParameters` table. All the data in the column will be lost.
  - Added the required column `voileId` to the `StaticParameters` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_StaticParameters" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "voileId" INTEGER NOT NULL,
    "kp_elevation" REAL NOT NULL,
    "ki_elevation" REAL NOT NULL,
    "kd_elevation" REAL NOT NULL,
    "kp_lacet" REAL NOT NULL,
    "ki_lacet" REAL NOT NULL,
    "kd_lacet" REAL NOT NULL,
    CONSTRAINT "StaticParameters_voileId_fkey" FOREIGN KEY ("voileId") REFERENCES "Voile" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_StaticParameters" ("id", "kd_elevation", "kd_lacet", "ki_elevation", "ki_lacet", "kp_elevation", "kp_lacet") SELECT "id", "kd_elevation", "kd_lacet", "ki_elevation", "ki_lacet", "kp_elevation", "kp_lacet" FROM "StaticParameters";
DROP TABLE "StaticParameters";
ALTER TABLE "new_StaticParameters" RENAME TO "StaticParameters";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
