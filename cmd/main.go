package main

import (
	"fmt"
	"os"
	"os/exec"
	"time"
)

const (
	timestampFormat = "20060102150405"
	baseVersionEnv = "INPUT_BASE_VERSION"
	commitHashEnv = "GITHUB_SHA"
	shortCommitHashLength = 12
	separator = "-"
)

func main() {
	baseVersion := os.Getenv(baseVersionEnv)
	commitHash := os.Getenv(commitHashEnv)

	t := time.Now().UTC()
	timestamp := t.Format(timestampFormat)

	snapshot := fmt.Sprintf(
		"%s%s%s%s%s",
		baseVersion,
		separator,
		timestamp,
		separator,
		commitHash[:shortCommitHashLength],
	)

	fmt.Printf("Generating snapshot version - %s\n", snapshot)

	outputCmd := exec.Command("echo",
		fmt.Sprintf("\"::set-output name=SNAPSHOT_VERSION::%s\"", snapshot))

	fmt.Printf("Generated command - %s\n", outputCmd)
	fmt.Println("Executing shell script...")

	if err := outputCmd.Run(); err != nil {
		panic(err)
	}
}


