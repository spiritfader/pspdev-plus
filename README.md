# pspdev-plus

### What is this?
- This is the source that builds the https://hub.docker.com/r/spiritfader/pspdev-plus image.
<br>

### Tags/Versions:
- Tags are representative of the upstream main release tags here https://github.com/pspdev/pspdev 
<br>

### This image is comprised of these sources:
  - PSPDEV Toolchain - https://github.com/pspdev/pspdev
  - sign_np - https://github.com/swarzesherz/sign_np/
  - mkpsxiso - https://github.com/Lameguy64/mkpsxiso/
  - python venv with ``ECDSA`` and ``cryptodome``
<br>

### To use this in your project:

- pull the image with ``podman pull docker.io/spiritfader/pspdev-plus``

- run the container in your project source directory with:

``podman run --rm -it -v "$PWD":/source -w /source "$@" docker.io/spiritfader/pspdev-plus:latest`` followed by your desired commands (ie; ``make``)
<br>

### Convenience; 
- I recommend aliasing the command to something easier to type/remember. For example I alias this myself as;

- `alias pspmake=podman run --rm -it -v "$PWD":/source -w /source "$@" docker.io/spiritfader/pspdev-plus:latest make` and run it with ``pspmake`` in the project directory. 

- You can alias it to whatever you want for whatever usecase you have.

- If you're on windows, good luck with that but you can use powershell aliases to achieve the same functionality. 
<br>
<br>

**THIS IS NOT TESTED ON WINDOWS AND WILL NEVER BE TESTED ON WINDOWS**
- If you're on windows, "good luck/have fun."

- You can use powershell aliases to achieve the same functionality. 
