import { createFileRoute, useParams } from "@tanstack/react-router"

export const Route = createFileRoute("/posts/$postId")({
  loader: async ({ params }) => {
    // return fetchPost(params.postId)
  },
  component: PostComponent,
})

function PostComponent() {
  // const { postId } = Route.useLoaderData()
  const { postId } = useParams({ strict: false })

  return (
    <div className="p-2">
      {/* postId 변수를 템플릿 문자열로 사용하여 표시합니다. */}
      <h3>Welcome PostItem {postId}!</h3>
    </div>
  )
}
