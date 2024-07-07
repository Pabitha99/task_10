// Playlist class
class Playlist {
    name: string;
    genre: string;
    audioFiles: string[];

    constructor(name: string, genre: string) {
        this.name = name;
        this.genre = genre;
        this.audioFiles = [];
    }

    addAudio(audioUrl: string) {
        this.audioFiles.push(audioUrl);
    }

    searchAudioByName(name: string): string[] {
        return this.audioFiles.filter(audio => audio.includes(name));
    }
}


let playlists: Playlist[] = [];

// Function to create playlists
function createPlaylist(name: string, genre: string) {
    let playlist = new Playlist(name, genre);
    playlists.push(playlist);
    displayPlaylists();
}

// Function to add audio to playlist
function addAudioToPlaylist(playlistIndex: number, audioUrl: string) {
    playlists[playlistIndex].addAudio(audioUrl);
    displayPlaylists();
}

// Function to search audio in playlist
function searchAudioInPlaylist(playlistIndex: number, name: string): string[] {
    return playlists[playlistIndex].searchAudioByName(name);
}

// Function to display playlists
function displayPlaylists() {
    const playlistsElement = document.getElementById('playlists');
    playlistsElement.innerHTML = '';

    playlists.forEach((playlist, index) => {
        const playlistCard = document.createElement('div');
        playlistCard.classList.add('card', 'my-3');
        playlistCard.innerHTML = `
            <div class="card-body">
                <h5 class="card-title">${playlist.name}</h5>
                <p class="card-text">Genre: ${playlist.genre}</p>
                <button class="btn btn-primary btn-sm" onclick="playPlaylist(${index})">Play</button>
                <button class="btn btn-danger btn-sm" onclick="addAudioPrompt(${index})">Add Audio</button>
            </div>
        `;
        playlistsElement.appendChild(playlistCard);
    });
}

// Function to handle adding audio prompt
function addAudioPrompt(playlistIndex: number) {
    const audioUrl = prompt('Enter audio URL:');
    if (audioUrl) {
        addAudioToPlaylist(playlistIndex, audioUrl);
    }
}




// Example usage
createPlaylist('Relaxing Beats', 'Chill');
addAudioToPlaylist(0, 'https://example.com/audio1.mp3');
addAudioToPlaylist(0, 'https://example.com/audio2.mp3');
