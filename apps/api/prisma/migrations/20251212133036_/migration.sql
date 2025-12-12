-- CreateTable
CREATE TABLE "Metric" (
    "id" TEXT NOT NULL,
    "command" TEXT NOT NULL,
    "url" TEXT,
    "interpretation" TEXT,
    "success" BOOLEAN NOT NULL DEFAULT true,
    "error" TEXT,
    "timestamp" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Metric_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Command" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "command" TEXT NOT NULL,
    "url" TEXT,
    "result" TEXT,
    "success" BOOLEAN NOT NULL DEFAULT true,
    "executionTime" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Command_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "Metric_timestamp_idx" ON "Metric"("timestamp");

-- CreateIndex
CREATE INDEX "Metric_url_idx" ON "Metric"("url");

-- CreateIndex
CREATE INDEX "Metric_success_idx" ON "Metric"("success");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE INDEX "Command_userId_idx" ON "Command"("userId");

-- CreateIndex
CREATE INDEX "Command_createdAt_idx" ON "Command"("createdAt");

-- AddForeignKey
ALTER TABLE "Command" ADD CONSTRAINT "Command_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
