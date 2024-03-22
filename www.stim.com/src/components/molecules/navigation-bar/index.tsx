import { Link } from "@tanstack/react-router"
import { Fragment } from "react/jsx-runtime"

const PAGES = [
  { path: "/", label: "Home" },
  { path: "/posts", label: "Community" },
  { path: "/search", label: "Search" },
  { path: "/notifications", label: "Notifications" },
  { path: "/settings", label: "Settings" },
]

export default function NavigationBar() {
  return (
    <nav className=" fixed bottom-0 flex w-full justify-evenly">
      {PAGES.map((page) => (
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
            <p className=" t">{page.label}</p>
          </Link>
        </Fragment>
      ))}
    </nav>
  )
}
