/*
  Warnings:

  - A unique constraint covering the columns `[voileId]` on the table `StaticParameters` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "StaticParameters_voileId_key" ON "StaticParameters"("voileId");
