import React from "react"
import ReactDOM from "react-dom/client"
import { routeTree } from "@/routeTree.gen"
import { createRouter, ErrorComponent } from "@tanstack/react-router"

const defaultPendingComponent = () => <p>loading..</p>
const defaultErrorComponent = ({ error }: any) => (
  <ErrorComponent error={error} />
)
const context = {
  auth: undefined!,
}

export const router = createRouter({
  routeTree,
  defaultPendingComponent,
  defaultErrorComponent,
  defaultPreload: "intent",
  context,
})

declare module "@tanstack/react-router" {
  interface Register {
    // This infers the type of our router and registers it across your entire project
    router: typeof router
  }
}
