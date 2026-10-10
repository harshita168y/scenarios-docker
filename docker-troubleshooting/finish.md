# Nice work!

You diagnosed and fixed five common Docker failures:

| Symptom | First command | Root cause |
|---|---|---|
| Container exits immediately | `docker logs`, `docker inspect` | Missing required env var |
| Running but unreachable | `docker port`, `docker exec` | Wrong container port in `-p` |
| Can't resolve other container | `docker network inspect` | Default bridge has no DNS |
| Exit code 137 | `docker inspect` (OOMKilled) | Memory limit too low |
| Build fails | read the build output | Typos in tag and filenames |

**Debugging checklist**

1. `docker ps -a`: what state is it in?
2. `docker logs`: what did it say?
3. `docker inspect`: what config did it really get?
4. `docker exec`: what does it look like from inside?

Keep practising and good luck!
