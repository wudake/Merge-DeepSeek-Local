-- CreateTable
CREATE TABLE "social_media_commands" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(200) NOT NULL,
    "content" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "social_media_commands_pkey" PRIMARY KEY ("id")
);
