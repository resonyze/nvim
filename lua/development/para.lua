-- Define the string you want to pass to the external command
local input_string = [[
 Waits for jobs and their |on_exit| handlers to complete.
 
 {jobs} is a List of |job-id|s to wait for.
 {timeout} is the maximum waiting time in milliseconds. If
 omitted or -1, wait forever.
 
 Timeout of 0 can be used to check the status of a job: 
 ```vim
   let running = jobwait([{job-id}], 0)[0] == -1
 ```
 During jobwait() callbacks for jobs not in the {jobs} list may
 be invoked. The screen will not redraw unless |:redraw| is
 invoked by a callback.
 
 Returns a list of len({jobs}) integers, where each integer is
 the status of the corresponding job:
   Exit-code, if the job exited
   -1 if the timeout was exceeded
   -2 if the job was interrupted (by |CTRL-C|)
   -3 if the job-id is invalid
]]

-- Define the external command you want to run
local command = {"fmt", "-w", "1000"}

-- Create a new job instance
local job_id = vim.fn.jobstart(command, {
    on_stdout = function(_, data)
      P(data)
    end,
    stdout_buffered = true,
    stderr_buffered = true,
})

-- Write the input string to the job's stdin
vim.fn.chansend(job_id, input_string)
vim.fn.chanclose(job_id, "stdin")

-- Wait for the job to finish
vim.fn.jobwait({job_id}, 0)
