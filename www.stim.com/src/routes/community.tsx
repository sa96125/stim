import * as React from "react"
import { fetchUsers } from "@/utils/mockApis"
import { createFileRoute } from "@tanstack/react-router"

export const Route = createFileRoute("/community")({
  loader: () => fetchUsers(),
  component: CommunityComponent,
})

function CommunityComponent() {
  const users = Route.useLoaderData()
  return (
    <div className="p-2">
      <h3>Welcome Community!</h3>
    </div>
  )
}
