WorkerScript.onMessage = function(message)
{
    WorkerScript.sendMessage({ 'reply': 'Mouse is at ' + message.x + ',' + message.y })
}
