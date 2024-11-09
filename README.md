# Paragraph Rephrasing Vim Plugin
A Vim plugin to rephrase the selected paragraph inlinely.

# Demo
https://github.com/user-attachments/assets/2f2cefee-0723-4d86-b9a2-e086eac1b7a9

## Feature
1. Streamline daily task, rephrasing paragraph is my daily task especially writing commit message.
2. Modern, leveraging the modern LLM deployment framework ([ollama](https://github.com/ollama/ollama))
3. Security, leveraing the local LLM model.

## Prerequisites
1. Ollama server

For macOS user, install via:
```
$ brew install ollama
```
For Linux user, install via:
```
$ curl -fsSL https://ollama.com/install.sh | sh
```
[Reference](https://github.com/ollama/ollama/blob/main/docs/linux.md)

2. jq command for JSON processing, install via:

For macOS user, install via:
```
$ brew install jq
```
For Linux user, I think it shall be installed by default.

## Install the plugin
I use [vim-plug](https://github.com/junegunn/vim-plug) as the vim plugin manager. This is feasible if you use the same manager as well.
Open your `~/.vimrc`, Add the below to your Plugin manager.
```
call plug#begin()

...
Plug 'ChinYikMing/inline-message-rephraser'
...

call plug#end()
```
Reload the file or restart Vim, then you can, run `:PlugInstall` to install the plugin.

## Run your local ollama server
```
$ ollama serve
```

## Create message rephraser model
```
$ ollama create msg-rephraser -f Modelfile
```
Note: Modelfile can be used to set the system prompt.

Sample Modelfile for git commit message rephrasing:
```
FROM llama3.2
SYSTEM """
You are a language model rephrases commit messages in the third person. Each line should be limited to 72 characters; if this limit is exceeded, continue the text on a new line. Format the output as a single paragraph.

Example:
Instruct: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy"

Response: "Lorem Ipsum is simply dummy text of the printing and typesetting\n
industry. Lorem Ipsum is simply dummy"
"""
```

## Fire the plugin
1. Open your vim
2. Place your cursor at the point where you want to rephrase.
3. Run `:R` to rephrase

## TODO:
1. Use an excellent Modelfile to create a more powerful message rephraser.
2. More text selection granularity for rephrasing. E.g., line by line.
3. Add processing status indicator inside vim when inferencing LLM.

## Reference
- [ollama RESTful API](https://github.com/ollama/ollama/blob/main/docs/api.md)
