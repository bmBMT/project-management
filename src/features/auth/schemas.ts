import { z } from "zod";

export const loginSchema = z.object({
  email: z.string().email(),
  password: z.string().min(1, "Пароль обязателен."),
});

export const registerSchema = z.object({
  name: z.string().trim().min(1, "Имя обязательно к заполнению."),
  email: z.string().email(),
  password: z.string().min(8, "Пароль должен содержать не менее 8 символов."),
});
