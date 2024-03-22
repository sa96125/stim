import React, { Fragment } from "react"
import { Auth } from "@/utils/auth"
import { Outlet, createRootRouteWithContext } from "@tanstack/react-router"
import { TanStackRouterDevtools } from "@tanstack/router-devtools"
import NavigationBar from "@/components/molecules/navigation-bar"
import { useMediaQuery } from "usehooks-ts"

export const Route = createRootRouteWithContext<{ auth: Auth }>()({
  component: RootComponent,
})

const pages = [
  { path: "/", label: "Home" },
  { path: "/community", label: "Community" },
  { path: "/search", label: "Search" },
  { path: "/notifications", label: "Notifications" },
  { path: "/settings", label: "Settings" },
]

function RootComponent() {
  const isMobile = useMediaQuery("(max-width: 768px)")

  if (!isMobile) {
    return (
      <div className=" w-full h-screen flex flex-col items-center justify-center">
        <p className=" bg-amber-300">Unsupported device.</p>
        <p className=" font-thin">Please access from a mobile device.</p>
      </div>
    )
  }

  return (
    <>
      <NavigationBar />
      <div>
        {/* Render our first route match */}
        <Outlet />
      </div>
      <TanStackRouterDevtools position="bottom-left" />
    </>
  )
}
