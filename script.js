// LRU Cache implementation
class LRUCache {
    constructor(capacity) {
        this.capacity = capacity;
        this.cache = new Map();
        this.hits = 0;
        this.misses = 0;
    }

    get(key) {
        if (this.cache.has(key)) {
            // Move the accessed key to the end (most recently used)
            const value = this.cache.get(key);
            this.cache.delete(key);
            this.cache.set(key, value);
            this.hits++;
            return { value, hit: true };
        } else {
            this.misses++;
            return { value: null, hit: false };
        }
    }

    put(key, value) {
        if (this.cache.has(key)) {
            // Remove existing key to update its position
            this.cache.delete(key);
        } else if (this.cache.size >= this.capacity) {
            // Remove least recently used item (first item in Map)
            const lruKey = this.cache.keys().next().value;
            this.cache.delete(lruKey);
        }
        
        // Add new item as most recently used
        this.cache.set(key, value);
        return this.cache.size;
    }

    getCacheState() {
        return Array.from(this.cache.entries()).map(([key, value], index, arr) => ({
            key,
            value,
            isLRU: index === 0,
            isMRU: index === arr.length - 1
        }));
    }

    reset() {
        this.cache.clear();
        this.hits = 0;
        this.misses = 0;
    }
}

// DOM elements
const cacheSizeInput = document.getElementById('cache-size');
const keyInput = document.getElementById('key-input');
const valueInput = document.getElementById('value-input');
const operationSelect = document.getElementById('operation');
const executeBtn = document.getElementById('execute-btn');
const resetBtn = document.getElementById('reset-btn');
const cacheSlotsContainer = document.getElementById('cache-slots');
const currentCacheSizeSpan = document.getElementById('current-cache-size');
const hitCountSpan = document.getElementById('hit-count');
const missCountSpan = document.getElementById('miss-count');
const cacheSizeDisplaySpan = document.getElementById('cache-size-display');
const logEntriesContainer = document.getElementById('log-entries');

// Initialize cache
let cache = new LRUCache(parseInt(cacheSizeInput.value));
let operationCounter = 0;

// Initialize visualization
function initializeCacheVisualization() {
    updateCacheVisualization();
    updateStats();
    addLogEntry("Cache initialized with size " + cache.capacity);
}

// Update cache visualization
function updateCacheVisualization() {
    const cacheState = cache.getCacheState();
    const cacheSize = cache.capacity;
    
    // Update current cache size display
    currentCacheSizeSpan.textContent = cacheSize;
    
    // Clear cache slots
    cacheSlotsContainer.innerHTML = '';
    
    // Create cache slots
    for (let i = 0; i < cacheSize; i++) {
        const slot = document.createElement('div');
        slot.className = 'cache-slot';
        slot.id = `slot-${i}`;
        
        if (i < cacheState.length) {
            const item = cacheState[i];
            slot.innerHTML = `
                <div class="slot-index">${i+1}</div>
                <div class="slot-key">${item.key}</div>
                <div class="slot-value">${item.value}</div>
            `;
            
            if (item.isMRU) {
                slot.classList.add('mru');
            }
            
            if (item.isLRU) {
                slot.classList.add('lru');
            }
        } else {
            slot.innerHTML = `
                <div class="slot-index">${i+1}</div>
                <div class="slot-key empty-slot">Empty</div>
                <div class="slot-value empty-slot">---</div>
            `;
        }
        
        cacheSlotsContainer.appendChild(slot);
    }
    
    // Update cache usage display
    cacheSizeDisplaySpan.textContent = `${cacheState.length}/${cacheSize}`;
}

// Update statistics
function updateStats() {
    hitCountSpan.textContent = cache.hits;
    missCountSpan.textContent = cache.misses;
}

// Add log entry
function addLogEntry(message, type = "info") {
    operationCounter++;
    const logEntry = document.createElement('div');
    logEntry.className = `log-entry ${type}`;
    logEntry.textContent = `${operationCounter}. ${message}`;
    logEntriesContainer.prepend(logEntry);
    
    // Keep only last 10 log entries
    const entries = logEntriesContainer.querySelectorAll('.log-entry');
    if (entries.length > 10) {
        entries[entries.length - 1].remove();
    }
}

// Highlight a cache slot temporarily
function highlightSlot(index, isHit = false) {
    const slot = document.getElementById(`slot-${index}`);
    if (slot) {
        slot.classList.add('active');
        
        setTimeout(() => {
            slot.classList.remove('active');
        }, 1000);
    }
}

// Execute cache operation
function executeOperation() {
    const key = keyInput.value.trim().toUpperCase();
    const value = valueInput.value.trim();
    const operation = operationSelect.value;
    
    if (!key) {
        alert("Please enter a key");
        return;
    }
    
    if (operation === 'put' && !value) {
        alert("Please enter a value for put operation");
        return;
    }
    
    let result;
    let logMessage = "";
    let logType = "info";
    
    if (operation === 'put') {
        const previousSize = cache.cache.size;
        cache.put(key, value);
        const newSize = cache.cache.size;
        
        logMessage = `PUT: Added {${key}: ${value}} to cache`;
        
        // If cache was full and an item was evicted
        if (previousSize === cache.capacity && newSize === cache.capacity) {
            logMessage += " (LRU item was evicted)";
        }
        
        // Highlight the MRU slot (last item in cache)
        const cacheState = cache.getCacheState();
        if (cacheState.length > 0) {
            const mruIndex = cacheState.findIndex(item => item.isMRU);
            highlightSlot(mruIndex);
        }
    } else {
        // GET operation
        result = cache.get(key);
        
        if (result.hit) {
            logMessage = `GET: Key "${key}" found in cache, value = ${result.value}`;
            logType = "hit";
            
            // Highlight the accessed slot
            const cacheState = cache.getCacheState();
            const itemIndex = cacheState.findIndex(item => item.key === key);
            if (itemIndex !== -1) {
                highlightSlot(itemIndex, true);
            }
        } else {
            logMessage = `GET: Key "${key}" not found in cache`;
            logType = "miss";
        }
    }
    
    updateCacheVisualization();
    updateStats();
    addLogEntry(logMessage, logType);
    
    // Clear inputs for next operation
    if (operation === 'put') {
        keyInput.value = '';
        valueInput.value = '';
    }
    
    // Auto-focus on key input for next operation
    keyInput.focus();
}

// Reset cache
function resetCache() {
    const newSize = parseInt(cacheSizeInput.value);
    cache = new LRUCache(newSize);
    operationCounter = 0;
    
    logEntriesContainer.innerHTML = '';
    updateCacheVisualization();
    updateStats();
    addLogEntry(`Cache reset with size ${newSize}`);
}

// Event listeners
executeBtn.addEventListener('click', executeOperation);

resetBtn.addEventListener('click', resetCache);

cacheSizeInput.addEventListener('change', function() {
    const newSize = parseInt(this.value);
    if (newSize < 1) this.value = 1;
    if (newSize > 10) this.value = 10;
    resetCache();
});

// Allow Enter key to execute operation
keyInput.addEventListener('keypress', function(e) {
    if (e.key === 'Enter') executeOperation();
});

valueInput.addEventListener('keypress', function(e) {
    if (e.key === 'Enter') executeOperation();
});

// Initialize the visualization
initializeCacheVisualization();