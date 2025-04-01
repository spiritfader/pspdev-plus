#!/bin/bash
# pull the latest version tag into the tag variable and verify before starting podman image build
TAG="$(curl -sL https://api.github.com/repos/pspdev/pspdev/releases/latest | jq -r ".tag_name")"
if [ ${#TAG} -ge 9 ] && [ "${TAG::1}" == "v" ]; then
    echo "SUCCESS: $TAG has a length of ${#TAG} characters or more and the first character is ${TAG::1}."
    echo "Commencing image build with $TAG:"
    podman build --no-cache -t spiritfader/pspdev-plus .
    podman image tag localhost/spiritfader/pspdev-plus localhost/spiritfader/pspdev-plus:"$TAG"
    podman push spiritfader/pspdev-plus
    podman push spiritfader/pspdev-plus:"$TAG"
else
    echo "ERROR: Tag of $TAG failed the verification checks"
fi
