import { createFileRoute } from "@tanstack/react-router"

export const Route = createFileRoute("/posts/")({
  // loader: () => fetchPosts(),
  component: PostsIndexComponent,
})

function PostsIndexComponent() {
  return (
    <div className="p-2">
      <h3>Welcome Community!</h3>
    </div>
  )
}
