import * as React from "react"
import { createFileRoute } from "@tanstack/react-router"

export const Route = createFileRoute("/search")({
  component: Search,
})

function Search() {
  return (
    <div className="p-2">
      <h3>Welcome Search!</h3>
    </div>
  )
}
