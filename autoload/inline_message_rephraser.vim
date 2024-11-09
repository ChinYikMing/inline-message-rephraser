function! Get_prompt()
  let content = @o

  " Replace all newlines with spaces
  let content = substitute(content, '\n', ' ', 'g')

  " Replace multiple spaces with a single space
  let content = substitute(content, '\s\+', ' ', 'g')
  " Trim leading and trailing spaces
  let content = substitute(content, '^\s\+', '', '')
  let content = substitute(content, '\s\+$', '', '')
  return content
endfunction

function! inline_message_rephraser#rephrase()
    " Jump to beginning of sentence(BOS)
    normal! 0
    " Jump to the first line of the cursor block
    normal! {
    " Into visual line mode
    normal! V
    " Select the whole cursor block
    normal! }

    " Copy while cursor block to register o
    normal! "oy

    " Do Rephrase inlinely (leveraging ollama RESTful API)
    " ollama settings
    let ollama_model = "msg-rephraser"
    let ollama_host = "localhost"
    let ollama_port = 11434
    let ollama_task = "generate"
    let ollama_endpoint = "http://" . ollama_host . ":" . string(ollama_port) . "/api/" . ollama_task
    let ollama_prompt = Get_prompt()
    let http_client = "curl -s" " Silent mode
    let http_post_data = '{"model": "' . ollama_model . '", "prompt": "' . ollama_prompt . '", "stream": false}'
    " raw output
    let pipe_get_response = "| jq -r .response"
    " response from ollama API, store in register o
    let cmd = http_client . " " . ollama_endpoint . " -d '" . http_post_data . "'" . pipe_get_response
    let @o = system(cmd)

    " Jump to beginning of sentence(BOS)
    normal! 0
    " Into visual line mode, already at recent cursor block so no need {
    normal! V
    " Select the whole cursor block
    normal! }
    " Paste the response to the selected line
    normal! "oP
endfunction
