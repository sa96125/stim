import * as React from "react"

import { Auth, auth } from "@/utils/auth"
import { useMediaQuery } from "usehooks-ts"
import { Redirect, useRouter } from "@tanstack/react-router"
import { TanStackRouterDevtools } from "@tanstack/router-devtools"
import { Outlet, createRootRouteWithContext } from "@tanstack/react-router"

import NavigationBar from "@/components/molecules/NavigationBar"
import UnsupportedDevice from "@/components/templates/UnsupportedDevice"

export const Route = createRootRouteWithContext<{ auth: Auth }>()({
  component: RootComponent,
})

function RootComponent() {
  const router = useRouter()
  const isMobile = useMediaQuery("(max-width: 768px)")

  if (!isMobile) {
    return <UnsupportedDevice />
  }

  return (
    <>
      <Outlet />
      <NavigationBar />
      <TanStackRouterDevtools position="bottom-left" />
    </>
  )
}
