import {
  Link,
  Outlet,
  createRootRouteWithContext,
} from "@tanstack/react-router"
import { Auth } from "@/utils/auth"
import { Fragment } from "react/jsx-runtime"
import { TanStackRouterDevtools } from "@tanstack/router-devtools"

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
  return (
    <>
      <nav>
        {pages.map((page) => (
          <Fragment key={page.label}>
            <Link
              to={page.path}
              preload="intent"
              className={`block py-2 px-3 text-blue-700`}
              activeProps={{ className: `font-bold` }}
              activeOptions={
                {
                  // If the route points to the root of it's parent,
                  // make sure it's only active if it's exact
                  // exact: to === '.',
                }
              }
            >
              {page.label}
            </Link>
          </Fragment>
        ))}
      </nav>
      <div>
        {/* Render our first route match */}
        <Outlet />
      </div>
      <TanStackRouterDevtools position="bottom-left" />
    </>
  )
}
