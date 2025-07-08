package main

import (
	"fmt"
	"os"

	"github.com/spf13/cobra"
)

var name string

func main() {
	rootCmd := &cobra.Command{
		Use:   "greeter",
		Short: "A simple CLI to greet users",
		Long:  `Greeter is a CLI that greets the user with their name.`,
	}

	helloCmd := &cobra.Command{
		Use:   "hello",
		Short: "Say hello to someone",
		Run: func(cmd *cobra.Command, args []string) {
			if name == "" {
				fmt.Println("Hello, stranger!")
			} else {
				fmt.Printf("Hello, %s!\n", name)
			}
		},
	}

	helloCmd.Flags().StringVarP(&name, "name", "n", "", "Name of the person to greet")
	rootCmd.AddCommand(helloCmd)

	if err := rootCmd.Execute(); err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
}
