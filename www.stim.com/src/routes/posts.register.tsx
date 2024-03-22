import { createFileRoute } from "@tanstack/react-router"

export const Route = createFileRoute("/posts/register")({
  component: PostsRegisterComponent,
})

function PostsRegisterComponent() {
  return (
    <div className="p-2">
      <h3>Welcome PostsRegister!</h3>
    </div>
  )
}
