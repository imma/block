package cmd

import (
	"fmt"

	"github.com/spf13/cobra"
)

var listCmd = &cobra.Command{
	Use:   "list",
	Short: "A brief description of your command",
	Long: `A longer description that spans multiple lines and likely contains examples`,
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Println("list called")
	},
}

func init() {
	rootCmd.AddCommand(listCmd)
}
