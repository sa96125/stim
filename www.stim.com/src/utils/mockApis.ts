import axios from "axios"
import { produce } from "immer"

export interface User {
  id: number
  name: string
  username: string
  email: string
  address: Address
  phone: string
  website: string
}

export interface Address {
  street: string
  suite: string
  city: string
  zipcode: string
}

export async function loaderDelayFn<T>(fn: (...args: any[]) => Promise<T> | T) {
  const delay = Number(sessionStorage.getItem("loaderDelay") ?? 0)
  const delayPromise = new Promise((r) => setTimeout(r, delay))

  await delayPromise
  const res = await fn()

  return res
}

export async function actionDelayFn<T>(fn: (...args: any[]) => Promise<T> | T) {
  const delay = Number(sessionStorage.getItem("actionDelay") ?? 0)
  await new Promise((r) => setTimeout(r, delay))
  return fn()
}

let users: User[] = null!
let usersPromise: Promise<void>

const ensureUsers = async () => {
  if (!usersPromise) {
    usersPromise = Promise.resolve().then(async () => {
      const { data } = await axios.get(
        "https://jsonplaceholder.typicode.com/users"
      )
      users = data.slice(0, 10)
    })
  }

  await usersPromise
}

export type UsersSortBy = "name" | "id" | "email"

export async function fetchUsers({
  filterBy,
  sortBy,
}: { filterBy?: string; sortBy?: UsersSortBy } = {}) {
  return loaderDelayFn(() =>
    ensureUsers().then(() => {
      let usersDraft = users

      if (filterBy) {
        usersDraft = usersDraft.filter((d) =>
          d.name.toLowerCase().includes(filterBy.toLowerCase())
        )
      }

      if (sortBy) {
        usersDraft = [...usersDraft].sort((a, b) => {
          return a[sortBy] > b[sortBy] ? 1 : -1
        })
      }

      return usersDraft
    })
  )
}

export async function fetchUserById(id: number) {
  return loaderDelayFn(() =>
    ensureUsers().then(() => users.find((d) => d.id === id))
  )
}
