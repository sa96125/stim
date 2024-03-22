import { Button } from "@/components/ui/button"
import {
  Card,
  CardContent,
  CardDescription,
  CardFooter,
  CardHeader,
  CardTitle,
} from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { createFileRoute } from "@tanstack/react-router"

export const Route = createFileRoute("/(auth)/login")({
  component: LoginComponent,
})

function LoginComponent() {
  return (
    <div className="p-2">
      <h3>Welcome Login!</h3>
      <Card>
        <CardHeader>
          <CardTitle>Account</CardTitle>
          <CardDescription>
            Make changes to your account here. Click save when you're done.
          </CardDescription>
        </CardHeader>
        <CardContent className="space-y-2">
          <div className="space-y-1">
            <Label htmlFor="name">Email</Label>
            <Input id="name" defaultValue="Pedro Duarte" />
          </div>
          <div className="space-y-1">
            <Label htmlFor="password">Password</Label>
            <Input id="password" defaultValue="최소 몇 글짜, " />
          </div>
        </CardContent>
        <CardFooter>
          <Button>login</Button>
        </CardFooter>
      </Card>
    </div>
  )
}
