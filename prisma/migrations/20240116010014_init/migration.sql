-- CreateTable
CREATE TABLE "Voile" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "StaticParameters" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "voile_id" INTEGER NOT NULL,
    "kp_elevation" REAL NOT NULL,
    "ki_elevation" REAL NOT NULL,
    "kd_elevation" REAL NOT NULL,
    "kp_lacet" REAL NOT NULL,
    "ki_lacet" REAL NOT NULL,
    "kd_lacet" REAL NOT NULL,
    CONSTRAINT "StaticParameters_voile_id_fkey" FOREIGN KEY ("voile_id") REFERENCES "Voile" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "ZenithParameters" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "voile_id" INTEGER NOT NULL,
    "kp_azimuth" REAL NOT NULL,
    "ki_azimuth" REAL NOT NULL,
    "kd_azimuth" REAL NOT NULL,
    CONSTRAINT "ZenithParameters_voile_id_fkey" FOREIGN KEY ("voile_id") REFERENCES "Voile" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
