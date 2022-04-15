set client_min_messages to warning;

-- DANGER: this is NOT how to do it in the real world.
-- `drop schema` INSTANTLY ERASES EVERYTHING.
drop schema "public" cascade;

create schema "public";

CREATE TABLE "public.tasks" (
	"taskId" serial NOT NULL,
	"userId" integer NOT NULL,
	"createdAt" timestamp with time zone NOT NULL,
	"taskName" TEXT NOT NULL,
	"startDate" DATE NOT NULL,
	"startTimeSlot" TIME,
	"endDate" DATE NOT NULL,
	"endTimeSlot" TIME,
	"description" TEXT,
	"pomodoro" BOOLEAN NOT NULL,
	"recurring" BOOLEAN NOT NULL,
	CONSTRAINT "tasks_pk" PRIMARY KEY ("taskId")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.users" (
	"userId" serial NOT NULL,
	"username" TEXT NOT NULL UNIQUE,
	"hashedPasswords" TEXT NOT NULL,
	"email" TEXT NOT NULL,
	"createdAt" timestamp with time zone NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("userId")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "tasks" ADD CONSTRAINT "tasks_fk0" FOREIGN KEY ("userId") REFERENCES "users"("userId");
