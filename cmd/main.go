package main

import (
	"fmt"
	"os"
	"time"
)

const (
	timestampFormat = "20060102150405"
	baseVersionEnv = "BASE_VERSION"
	commitHashEnv = "GITHUB_SHA"
	snapshotVersionEnv = "SNAPSHOT_VERSION"
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

	err := os.Setenv(snapshotVersionEnv, snapshot)
	if err != nil {
		panic(err)
	}

	fmt.Printf("Generating snapshot version - %s\n", snapshot)
}


