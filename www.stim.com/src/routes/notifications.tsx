import * as React from "react"
import { createFileRoute } from "@tanstack/react-router"

export const Route = createFileRoute("/notifications")({
  component: NotificationsComponent,
})

function NotificationsComponent() {
  return (
    <div className="p-2">
      <h3>Welcome Notifications!</h3>
    </div>
  )
}
