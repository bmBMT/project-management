import { z } from "zod";

import { TaskStatus } from "./types";

export const createTaskSchema = z.object({
  name: z.string().trim().min(1, "Поле обязательно"),
  status: z.nativeEnum(TaskStatus, { required_error: "Поле обязательно" }),
  workspaceId: z.string().trim().min(1, "Поле обязательно"),
  projectId: z.string().trim().min(1, "Поле обязательно"),
  dueDate: z.coerce.date(),
  assigneeId: z.string().trim().min(1, "Поле обязательно"),
  description: z.string().optional(),
});
