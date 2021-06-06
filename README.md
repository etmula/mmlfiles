# mmlfiles

## Dependencies
Multi processing software for compress/decompress.
```
$ sudo apt install pbzip2
```

## Using

1. Clone this repository
2. Decompress
```
$ . decompress.sh
```

## For developers
1. Checkout a new branch named version of MML(like `5.57.1355`).
2. Remove old MML files
3. Create new MML files
4. Compress new MML files
```
$ . compress.sh
```
5. Push and PullRequest
6. Check the result of CI when PullRequest.