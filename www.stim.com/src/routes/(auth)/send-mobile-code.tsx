import { createFileRoute } from "@tanstack/react-router"

export const Route = createFileRoute("/(auth)/send-mobile-code")({
  component: () => <div>Hello /(auth)/send-mobile-code!</div>,
})
