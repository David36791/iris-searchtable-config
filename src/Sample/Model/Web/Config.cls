Class Sample.Model.Web.Config Extends %ZEN.Component.page
{

/// The class name of the application to which this page belongs.
Parameter APPLICATION;

/// This style block contains page specific CSS style definitions.
XData Style
{
<style type="text/css">

</style>
}

/// This XML block defines the content of this page
XData Contents [ XMLNamespace = "http://www.intersystems.com/zen" ]
{
<page xmlns="http://www.intersystems.com/zen" title="SearchTable Config">
	<html id="description"  OnDrawContent="DrawContent"/>
</page>
}

Method DrawContent(pSeed As %String) As %Status
{
	
	&html<
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Searchtable Config</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #f5f7fa;
            color: #333;
            line-height: 1.6;
            padding: 20px;
        }
        
        .container {
            max-width: 1400px;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        
        header {
            text-align: center;
            padding: 20px 0;
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            border-radius: 10px;
            color: white;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        
        h1 {
            font-size: 2.5rem;
            margin-bottom: 10px;
        }
        
        .subtitle {
            font-size: 1.1rem;
            opacity: 0.9;
        }
        
        .main-content {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
        
        .panel {
            flex: 1;
            min-width: 300px;
            background-color: white;
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
        }
        
        .panel-title {
            font-size: 1.4rem;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid #f0f0f0;
            color: #2c3e50;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .panel-title i {
            color: #6a11cb;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #444;
        }
        
        select, input, textarea {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 1rem;
            transition: border 0.3s;
        }
        
        select:focus, input:focus, textarea:focus {
            border-color: #6a11cb;
            outline: none;
            box-shadow: 0 0 0 2px rgba(106, 17, 203, 0.1);
        }
        
        .btn {
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 6px;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s;
            font-weight: 600;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }
        
        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(106, 17, 203, 0.2);
        }
        
        .btn-secondary {
            background: #f8f9fa;
            color: #444;
            border: 1px solid #ddd;
        }
        
        .btn-secondary:hover {
            background: #e9ecef;
        }
        
        .btn-success {
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
        }
        
        .btn-success:hover {
            box-shadow: 0 6px 12px rgba(40, 167, 69, 0.2);
        }
        
        .btn-loading {
            background: #6c757d;
            cursor: not-allowed;
        }
        
        .btn-loading:hover {
            transform: none;
            box-shadow: none;
        }
        
        .config-list {
            margin-top: 25px;
        }
        
        .config-item {
            background-color: #f9f9f9;
            border-radius: 6px;
            padding: 15px;
            margin-bottom: 15px;
            border-left: 4px solid #6a11cb;
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            transition: all 0.3s;
            position: relative;
        }
        
        .config-item:hover {
            background-color: #f0f4ff;
            transform: translateX(5px);
        }
        
        .config-info {
            flex: 1;
            min-width: 0;
            overflow: hidden;
        }
        
        .config-info h4 {
            color: #2c3e50;
            margin-bottom: 5px;
            font-size: 1rem;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        
        .config-path {
            color: #666;
            font-size: 0.85rem;
            word-break: break-all;
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            line-height: 1.4;
            max-height: 2.8em;
        }
        
        .config-actions {
            display: flex;
            gap: 10px;
            flex-shrink: 0;
            margin-left: 15px;
        }
        
        .btn-icon {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            background-color: white;
            border: 1px solid #ddd;
            color: #666;
            transition: all 0.2s;
            flex-shrink: 0;
        }
        
        .btn-icon:hover {
            background-color: #6a11cb;
            color: white;
            border-color: #6a11cb;
        }
        
        .btn-delete:hover {
            background-color: #e74c3c;
            border-color: #e74c3c;
        }
        
        .xml-preview {
            background-color: #f9f9f9;
            border-radius: 6px;
            padding: 15px;
            margin-top: 15px;
            max-height: 300px;
            overflow-y: auto;
            font-family: 'Courier New', monospace;
            font-size: 0.9rem;
            border: 1px solid #eee;
        }
        
        .xml-line {
            padding: 2px 5px;
            margin: 2px 0;
            border-radius: 3px;
            cursor: pointer;
            transition: background-color 0.2s;
            white-space: pre;
            font-family: 'Courier New', monospace;
            position: relative;
        }
        
        .xml-line:hover {
            background-color: #e6f3ff;
        }
        
        .xml-line.selected {
            background-color: #cce5ff;
            font-weight: bold;
        }
        
        .tag {
            color: #2c3e50;
            font-weight: bold;
        }
        
        .attr-name {
            color: #e74c3c;
        }
        
        .attr-value {
            color: #2980b9;
        }
        
        .text {
            color: #27ae60;
        }
        
        .comment {
            color: #999;
            font-style: italic;
        }
        
        .alert {
            padding: 12px 15px;
            border-radius: 6px;
            margin-bottom: 20px;
            display: none;
        }
        
        .alert-success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        
        .alert-error {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
        
        .alert-info {
            background-color: #d1ecf1;
            color: #0c5460;
            border: 1px solid #bee5eb;
        }
        
        .alert-warning {
            background-color: #fff3cd;
            color: #856404;
            border: 1px solid #ffeaa7;
        }
        
        .empty-state {
            text-align: center;
            padding: 40px 20px;
            color: #999;
        }
        
        .empty-state i {
            font-size: 3rem;
            margin-bottom: 15px;
            color: #ddd;
        }
        
        .service-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        
        .current-service {
            font-weight: 600;
            color: #6a11cb;
        }
        
        footer {
            text-align: center;
            margin-top: 30px;
            padding-top: 20px;
            color: #777;
            border-top: 1px solid #eee;
            font-size: 0.9rem;
        }
        
        .xpath-tooltip {
            position: absolute;
            background: #333;
            color: white;
            padding: 5px 10px;
            border-radius: 4px;
            font-size: 12px;
            z-index: 1000;
            pointer-events: none;
            white-space: nowrap;
            max-width: 400px;
            word-wrap: break-word;
            white-space: normal;
        }
        
        .node-info {
            font-size: 12px;
            color: #666;
            margin-top: 5px;
            font-style: italic;
        }
        
        .selection-hint {
            background-color: #e8f4fd;
            border-left: 4px solid #3498db;
            padding: 10px;
            margin-top: 10px;
            border-radius: 4px;
            font-size: 13px;
        }
        
        .clickable {
            cursor: pointer;
            border-radius: 2px;
            padding: 0 2px;
        }
        
        .clickable:hover {
            background-color: rgba(52, 152, 219, 0.1);
        }
        
        .btn-group {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }
        
        .full-xpath-tooltip {
            position: absolute;
            background: #333;
            color: white;
            padding: 8px 12px;
            border-radius: 4px;
            font-size: 12px;
            z-index: 1000;
            max-width: 500px;
            word-wrap: break-word;
            white-space: normal;
            display: none;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }
        
        .config-path:hover + .full-xpath-tooltip {
            display: block;
        }
        
        .path-wrapper {
            position: relative;
        }
        
        .refresh-btn {
            margin-left: 10px;
            padding: 8px 12px;
            background-color: #f8f9fa;
            border: 1px solid #ddd;
            border-radius: 6px;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 5px;
            transition: all 0.3s;
        }
        
        .refresh-btn:hover {
            background-color: #e9ecef;
        }
        
        .service-id {
            font-size: 0.8rem;
            color: #666;
            margin-left: 5px;
        }
        
        .form-actions {
            display: flex;
            gap: 10px;
            margin-top: 20px;
        }
        
        .response-preview {
            background-color: #f8f9fa;
            border: 1px solid #e9ecef;
            border-radius: 6px;
            padding: 15px;
            margin-top: 20px;
            max-height: 200px;
            overflow-y: auto;
            font-family: 'Courier New', monospace;
            font-size: 0.85rem;
            white-space: pre-wrap;
        }
        
        .response-title {
            font-weight: 600;
            margin-bottom: 10px;
            color: #495057;
        }
        
        @media (max-width: 768px) {
            .main-content {
                flex-direction: column;
            }
            
            h1 {
                font-size: 2rem;
            }
            
            .panel {
                padding: 20px;
            }
            
            .btn-group {
                flex-direction: column;
            }
            
            .config-item {
                flex-direction: column;
            }
            
            .config-actions {
                margin-left: 0;
                margin-top: 10px;
                align-self: flex-end;
            }
            
            .form-actions {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h1>Searchtable Config</h1>
            <p class="subtitle">Service Configuration and XPath Extraction Tool</p>
        </header>
        
        <div class="main-content">
            <div class="panel">
                <h2 class="panel-title"><i class="fas fa-cogs"></i> Service Configuration</h2>
                
                <div class="alert alert-error" id="error-alert">
                    <i class="fas fa-exclamation-circle"></i> <span id="error-message">Name must be unique within the same service!</span>
                </div>
                
                <div class="alert alert-success" id="success-alert">
                    <i class="fas fa-check-circle"></i> <span id="success-message">Configuration item added successfully!</span>
                </div>
                
                <div class="alert alert-info" id="info-alert">
                    <i class="fas fa-info-circle"></i> <span id="info-message"></span>
                </div>
                
                <div class="alert alert-warning" id="warning-alert">
                    <i class="fas fa-exclamation-triangle"></i> <span id="warning-message"></span>
                </div>
                
                <div class="form-group">
                    <label for="service-select"><i class="fas fa-server"></i> Select Service</label>
                    <div style="display: flex; align-items: center; gap: 10px;">
                        <select id="service-select" style="flex: 1;">
                            <option value="">-- Loading... --</option>
                        </select>
                        <button class="refresh-btn" id="refresh-services-btn" title="Refresh Service List">
                            <i class="fas fa-sync-alt"></i>
                        </button>
                    </div>
                </div>
                
                <div class="service-header">
                    <h3>Configuration Management</h3>
                    <span class="current-service" id="current-service">No Service Selected</span>
                </div>
                
                <div id="config-form" style="display: none;">
                    <div class="form-group">
                        <label for="config-name"><i class="fas fa-tag"></i> Name *</label>
                        <input type="text" id="config-name" placeholder="Enter configuration name">
                        <small style="color: #666; font-size: 0.85rem;">Name must be unique within the same service</small>
                    </div>
                    
                    <div class="form-group">
                        <label for="config-path"><i class="fas fa-code"></i> XPath Path *</label>
                        <div style="display: flex; gap: 10px;">
                            <input type="text" id="config-path" placeholder="Enter XML XPath path">
                            <button class="btn btn-secondary" id="select-xpath-btn" title="Select node from XML">
                                <i class="fas fa-mouse-pointer"></i>
                            </button>
                        </div>
                        <small style="color: #666; font-size: 0.85rem;">Click the button on the right to select node from XML to get path</small>
                    </div>
                    
                    <div class="form-actions">
                        <button class="btn" id="add-config-btn">
                            <i class="fas fa-plus"></i> Add Configuration
                        </button>
                        
                        <button class="btn btn-success" id="save-config-btn">
                            <i class="fas fa-save"></i> Save Configuration
                        </button>
                    </div>
                </div>
                
                <div class="config-list" id="config-list">
                    <div class="empty-state" id="empty-config">
                        <i class="fas fa-folder-open"></i>
                        <p>Please select a service first, then add configuration items</p>
                    </div>
                </div>
                
                <div id="response-preview-container" style="display: none;">
                    <div class="response-title">API Response:</div>
                    <div class="response-preview" id="response-preview"></div>
                </div>
            </div>
            
            <div class="panel">
                <h2 class="panel-title"><i class="fas fa-code"></i> XML Processing and XPath Extraction</h2>
                
                <div class="form-group">
                    <label for="xml-input"><i class="fas fa-file-code"></i> XML Input (message)</label>
                    <textarea id="xml-input" rows="8" placeholder="Enter XML content...">


					</textarea>
                </div>
                
                <div class="selection-hint">
                    <strong>Selection Hint:</strong> Click any tag, attribute, or text in the XML preview to get the corresponding XPath. Selected nodes will be highlighted.
                </div>
                
                <div class="btn-group">
                    <button class="btn" id="format-xml-btn">
                        <i class="fas fa-indent"></i> Format XML
                    </button>
                    
                    <button class="btn btn-secondary" id="clear-xml-btn">
                        <i class="fas fa-broom"></i> Clear XML
                    </button>
                </div>
                
                <div class="form-group">
                    <label><i class="fas fa-mouse-pointer"></i> XML Preview (Click nodes to get XPath)</label>
                    <div class="xml-preview" id="xml-preview">
                        <div class="empty-state" id="empty-xml">
                            <i class="fas fa-code"></i>
                            <p>After entering XML and clicking the format button, formatted XML will be displayed here</p>
                            <p>Click XML nodes to get their XPath paths</p>
                        </div>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="selected-xpath"><i class="fas fa-project-diagram"></i> Current Selected Node XPath</label>
                    <input type="text" id="selected-xpath" readonly placeholder="Click XML nodes above to get XPath">
                </div>
                
                <div id="node-info" class="node-info"></div>
                
                <button class="btn" id="apply-xpath-btn" disabled>
                    <i class="fas fa-check-circle"></i> Apply XPath to Current Config
                </button>
            </div>
        </div>
        
        <footer>
            <p>Searchtable Config &copy; 2023 | Configuration names must be unique within the same service | Click XML nodes to get XPath</p>
        </footer>
    </div>

    <script type="text/javascript">
        // Server configuration - configure IP and port in code
        const SERVER_ADDRESS = 'http://localhost:52773';
        
        // Data storage structure
        const configData = {};
        
        // Currently selected service and configuration items
        let currentService = '';
        let currentServiceName = '';
        let currentSearchTableName = '';
        let selectedXPath = '';
        let selectedNode = null;
        let xmlDoc = null;
        let xmlNodesMap = new Map(); // Store mapping of node IDs to node objects
        let currentLineId = 0; // Current line ID
        
        // DOM elements
        const serviceSelect = document.getElementById('service-select');
        const refreshServicesBtn = document.getElementById('refresh-services-btn');
        const configForm = document.getElementById('config-form');
        const configName = document.getElementById('config-name');
        const configPath = document.getElementById('config-path');
        const addConfigBtn = document.getElementById('add-config-btn');
        const saveConfigBtn = document.getElementById('save-config-btn');
        const configList = document.getElementById('config-list');
        const emptyConfig = document.getElementById('empty-config');
        const currentServiceSpan = document.getElementById('current-service');
        const xmlInput = document.getElementById('xml-input');
        const formatXmlBtn = document.getElementById('format-xml-btn');
        const clearXmlBtn = document.getElementById('clear-xml-btn');
        const xmlPreview = document.getElementById('xml-preview');
        const emptyXml = document.getElementById('empty-xml');
        const selectedXPathInput = document.getElementById('selected-xpath');
        const applyXPathBtn = document.getElementById('apply-xpath-btn');
        const selectXPathBtn = document.getElementById('select-xpath-btn');
        const errorAlert = document.getElementById('error-alert');
        const successAlert = document.getElementById('success-alert');
        const infoAlert = document.getElementById('info-alert');
        const warningAlert = document.getElementById('warning-alert');
        const errorMessage = document.getElementById('error-message');
        const successMessage = document.getElementById('success-message');
        const infoMessage = document.getElementById('info-message');
        const warningMessage = document.getElementById('warning-message');
        const nodeInfoDiv = document.getElementById('node-info');
        const responsePreviewContainer = document.getElementById('response-preview-container');
        const responsePreview = document.getElementById('response-preview');
        
        // Initialization
        document.addEventListener('DOMContentLoaded', function() {
            // Load data from localStorage
            loadData();
            
            // Load service list from API
            loadServices();
            
            // Service selection event
            serviceSelect.addEventListener('change', async function() {
                const selectedIndex = this.selectedIndex;
                
                // Clear previous API response display
                clearResponsePreview();
                
                if (selectedIndex === 0) {
                    configForm.style.display = 'none';
                    currentServiceSpan.textContent = 'No Service Selected';
                    configList.innerHTML = '';
                    configList.appendChild(emptyConfig);
                    responsePreviewContainer.style.display = 'none';
                    return;
                }
                
                const selectedOption = this.options[selectedIndex];
                const serviceId = selectedOption.getAttribute('data-id');
                const serviceName = selectedOption.getAttribute('data-name');
                
                currentService = serviceId;
                currentServiceName = serviceName;
                
                if (currentService) {
                    configForm.style.display = 'block';
                    currentServiceSpan.textContent = `${serviceName} (ID: ${serviceId})`;
                    
                    // Load configuration list
                    await loadServiceConfig(serviceName);
                } else {
                    configForm.style.display = 'none';
                    currentServiceSpan.textContent = 'No Service Selected';
                    configList.innerHTML = '';
                    configList.appendChild(emptyConfig);
                    responsePreviewContainer.style.display = 'none';
                }
            });
            
            // Add configuration item
            addConfigBtn.addEventListener('click', addConfig);
            
            // Save configuration
            saveConfigBtn.addEventListener('click', saveConfig);
            
            // Format XML
            formatXmlBtn.addEventListener('click', formatXML);
            
            // Clear XML
            clearXmlBtn.addEventListener('click', function() {
                xmlInput.value = '';
                xmlPreview.innerHTML = '';
                xmlPreview.appendChild(emptyXml);
                selectedXPathInput.value = '';
                selectedXPath = '';
                selectedNode = null;
                applyXPathBtn.disabled = true;
                nodeInfoDiv.textContent = '';
                xmlDoc = null;
                xmlNodesMap.clear();
            });
            
            // Apply XPath to current configuration
            applyXPathBtn.addEventListener('click', function() {
                if (selectedXPath && configPath) {
                    configPath.value = selectedXPath;
                    showAlert('XPath applied to current configuration', 'success');
                }
            });
            
            // Select XPath from XML
            selectXPathBtn.addEventListener('click', function() {
                if (!currentService) {
                    showAlert('Please select a service first', 'error');
                    return;
                }
                
                if (xmlPreview.contains(emptyXml)) {
                    showAlert('Please enter and format XML first', 'error');
                    return;
                }
                
                showAlert('Please click XML nodes above to select XPath path', 'success');
            });
            
            // Refresh service list
            refreshServicesBtn.addEventListener('click', function() {
                loadServices();
            });
            
            // Add keyboard events for configuration name and path
            configName.addEventListener('keypress', function(e) {
                if (e.key === 'Enter') addConfig();
            });
            
            configPath.addEventListener('keypress', function(e) {
                if (e.key === 'Enter') addConfig();
            });
            
            // Initial display of formatted XML
            setTimeout(formatXML, 100);
        });
        
        // Clear API response preview
        function clearResponsePreview() {
            responsePreviewContainer.style.display = 'none';
            responsePreview.textContent = '';
        }
        
        // Load service list from API
        async function loadServices() {
            const originalText = refreshServicesBtn.innerHTML;
            refreshServicesBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i>';
            refreshServicesBtn.disabled = true;
            serviceSelect.disabled = true;
            
            try {
                const response = await fetch(`${SERVER_ADDRESS}/Demo/GetService`, {
                    method: 'GET',
                    headers: {
                        'Content-Type': 'application/json'
                    }
                });
                
                if (!response.ok) {
                    throw new Error(`HTTP Error: ${response.status} ${response.statusText}`);
                }
                
                const data = await response.json();
                
                if (data.code === 200 && data.success) {
                    // Clear dropdown, keep first option
                    serviceSelect.innerHTML = '<option value="">-- Select Service --</option>';
                    
                    // Add service options
                    if (data.data && Array.isArray(data.data) && data.data.length > 0) {
                        data.data.forEach(service => {
                            const option = document.createElement('option');
                            option.value = service.ID; // Use ID as value
                            option.textContent = `${service.Name} (ID: ${service.ID})`;
                            option.setAttribute('data-id', service.ID);
                            option.setAttribute('data-name', service.Name);
                            serviceSelect.appendChild(option);
                            
                            // Initialize configuration storage for this service
                            if (!configData[service.ID]) {
                                configData[service.ID] = [];
                            }
                        });
                        
                        showAlert(`Successfully loaded ${data.data.length} services`, 'success');
                    } else {
                        serviceSelect.innerHTML = '<option value="">-- No services available --</option>';
                        showAlert('API returned empty service list', 'info');
                    }
                } else {
                    throw new Error(data.message || 'API returned data format error');
                }
            } catch (error) {
                console.error('Failed to load service list:', error);
                showAlert(`Failed to load service list: ${error.message}`, 'error');
                serviceSelect.innerHTML = '<option value="">-- Load failed, check server connection --</option>';
            } finally {
                refreshServicesBtn.innerHTML = '<i class="fas fa-sync-alt"></i>';
                refreshServicesBtn.disabled = false;
                serviceSelect.disabled = false;
            }
        }
        
        // Load service configuration
        async function loadServiceConfig(serviceName) {
            try {
                // Step 1: Get SearchTableName
                const searchTableResponse = await fetch(`${SERVER_ADDRESS}/Demo/getSearchTableByService`, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                        ServiceName: serviceName
                    })
                });
                
                if (!searchTableResponse.ok) {
                    throw new Error(`Failed to get SearchTableName: ${searchTableResponse.status} ${searchTableResponse.statusText}`);
                }
                
                const searchTableData = await searchTableResponse.json();
                
                if (searchTableData.code !== 200 || !searchTableData.success) {
                    throw new Error(searchTableData.message || 'Get SearchTableName API returned data format error');
                }
                
                currentSearchTableName = searchTableData.data.Value;
                
                // Step 2: Get configuration list
                const configResponse = await fetch(`${SERVER_ADDRESS}/Demo/GetServiceConfig`, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                        ServiceName: serviceName,
                        SearchTableName: currentSearchTableName
                    })
                });
                
                if (!configResponse.ok) {
                    throw new Error(`Failed to get configuration list: ${configResponse.status} ${configResponse.statusText}`);
                }
                
                const configDataResponse = await configResponse.json();
                
                if (configDataResponse.code !== 200 || !configDataResponse.success) {
                    throw new Error(configDataResponse.message || 'Get configuration list API returned data format error');
                }
                
                // Clear current service configuration data
                configData[currentService] = [];
                
                // Add configuration items from API to configData
                if (configDataResponse.data && Array.isArray(configDataResponse.data)) {
                    configDataResponse.data.forEach(config => {
                        configData[currentService].push({
                            name: config.name,
                            path: config.path
                        });
                    });
                }
                
                // Save to localStorage
                saveData();
                
                // Refresh configuration list display
                displayConfigList();
                
                showAlert(`Successfully loaded configuration for service "${serviceName}"`, 'success');
            } catch (error) {
                console.error('Failed to load service configuration:', error);
                showAlert(`Failed to load service configuration: ${error.message}`, 'error');
                configData[currentService] = [];
                displayConfigList();
            }
        }
        
        // Display configuration list
        function displayConfigList() {
            const configs = configData[currentService] || [];
            configList.innerHTML = '';
            
            if (configs.length === 0) {
                configList.appendChild(emptyConfig);
                return;
            }
            
            configs.forEach((config, index) => {
                const configItem = document.createElement('div');
                configItem.className = 'config-item';
                
                // Create full XPath tooltip
                const fullPathTooltip = document.createElement('div');
                fullPathTooltip.className = 'full-xpath-tooltip';
                fullPathTooltip.textContent = config.path;
                fullPathTooltip.style.position = 'absolute';
                fullPathTooltip.style.left = '0';
                fullPathTooltip.style.top = '100%';
                fullPathTooltip.style.zIndex = '1000';
                fullPathTooltip.style.display = 'none';
                
                // Create path wrapper
                const pathWrapper = document.createElement('div');
                pathWrapper.className = 'path-wrapper';
                pathWrapper.style.position = 'relative';
                
                // Create configuration path element
                const pathElement = document.createElement('div');
                pathElement.className = 'config-path';
                pathElement.textContent = config.path;
                pathElement.title = config.path; // Add title attribute for basic tooltip
                
                // Show full path on mouse hover
                pathElement.addEventListener('mouseenter', function(e) {
                    fullPathTooltip.style.display = 'block';
                    // Position tooltip
                    const rect = this.getBoundingClientRect();
                    fullPathTooltip.style.left = '0';
                    fullPathTooltip.style.top = rect.height + 'px';
                });
                
                pathElement.addEventListener('mouseleave', function() {
                    fullPathTooltip.style.display = 'none';
                });
                
                // Add path element and tooltip to wrapper
                pathWrapper.appendChild(pathElement);
                pathWrapper.appendChild(fullPathTooltip);
                
                configItem.innerHTML = `
                    <div class="config-info">
                        <h4 title="${config.name}">${config.name}</h4>
                    </div>
                    <div class="config-actions">
                        <div class="btn-icon btn-edit" title="Edit" data-index="${index}">
                            <i class="fas fa-edit"></i>
                        </div>
                        <div class="btn-icon btn-delete" title="Delete" data-index="${index}">
                            <i class="fas fa-trash"></i>
                        </div>
                    </div>
                `;
                
                // Add path wrapper to config info
                const configInfo = configItem.querySelector('.config-info');
                configInfo.appendChild(pathWrapper);
                
                configList.appendChild(configItem);
            });
            
            // Add edit and delete events
            document.querySelectorAll('.btn-edit').forEach(btn => {
                btn.addEventListener('click', function() {
                    const index = parseInt(this.getAttribute('data-index'));
                    editConfig(index);
                });
            });
            
            document.querySelectorAll('.btn-delete').forEach(btn => {
                btn.addEventListener('click', function() {
                    const index = parseInt(this.getAttribute('data-index'));
                    deleteConfig(index);
                });
            });
        }
        
        // Add configuration item
        function addConfig() {
            const name = configName.value.trim();
            const path = configPath.value.trim();
            
            if (!currentService) {
                showAlert('Please select a service first', 'error');
                return;
            }
            
            if (!name) {
                showAlert('Please enter configuration name', 'error');
                configName.focus();
                return;
            }
            
            if (!path) {
                showAlert('Please enter XPath path', 'error');
                configPath.focus();
                return;
            }
            
            // Check if name is unique within the same service
            const isDuplicate = configData[currentService].some(item => item.name === name);
            if (isDuplicate) {
                showAlert(`Service "${currentServiceName}" already has a configuration item named "${name}"`, 'error');
                configName.focus();
                return;
            }
            
            // Add configuration item
            configData[currentService].push({
                name: name,
                path: path
            });
            
            // Save to localStorage
            saveData();
            
            // Clear form
            configName.value = '';
            configPath.value = '';
            
            // Refresh configuration list
            displayConfigList();
            
            // Show success message
            showAlert(`Configuration item "${name}" added successfully`, 'success');
        }
        
        // Save configuration to server
        async function saveConfig() {
            if (!currentService) {
                showAlert('Please select a service first', 'error');
                return;
            }
            
            if (!currentServiceName) {
                showAlert('Service name not set', 'error');
                return;
            }
            
//            if (!currentSearchTableName) {
//                showAlert('SearchTableName not obtained, please reselect service', 'error');
//                return;
//            }
            
            const configs = configData[currentService] || [];
            
            if (configs.length === 0) {
                showAlert('Current service has no configuration items, please add configuration first', 'error');
                return;
            }
            
            // Build request parameters
            const requestData = {
                ServiceName: currentServiceName,
                SearchTableName: currentSearchTableName,
                Config: configs
            };
            
            const originalText = saveConfigBtn.innerHTML;
            saveConfigBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Saving...';
            saveConfigBtn.classList.add('btn-loading');
            saveConfigBtn.disabled = true;
            
            try {
                const response = await fetch(`${SERVER_ADDRESS}/Demo/SearchTableConfig`, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(requestData)
                });
                
                if (!response.ok) {
                    throw new Error(`HTTP Error: ${response.status} ${response.statusText}`);
                }
                
                // Get response text
                const responseText = await response.text();
                
                // Show response preview
                responsePreviewContainer.style.display = 'block';
                responsePreview.textContent = responseText;
                
                // Try to extract JSON part from response text
                let jsonData = null;
                try {
                    // Find the last '{' and '}' positions
                    const lastBraceOpen = responseText.lastIndexOf('{');
                    const lastBraceClose = responseText.lastIndexOf('}');
                    
                    if (lastBraceOpen !== -1 && lastBraceClose !== -1 && lastBraceClose > lastBraceOpen) {
                        const jsonStr = responseText.substring(lastBraceOpen, lastBraceClose + 1);
                        jsonData = JSON.parse(jsonStr);
                    } else {
                        // If no complete JSON found, try to parse entire response
                        jsonData = JSON.parse(responseText);
                    }
                } catch (jsonError) {
                    console.error('Failed to parse JSON response:', jsonError);
                    // If cannot parse JSON, try to find code field
                    const codeMatch = responseText.match(/"code"\s*:\s*(\d+)/);
                    if (codeMatch) {
                        jsonData = { code: parseInt(codeMatch[1]) };
                    } else {
                        throw new Error('Response format incorrect, cannot extract JSON data');
                    }
                }
                
                // Determine response status
                if (jsonData && jsonData.code === 200) {
                    showAlert('Configuration saved successfully!', 'success');
                } else if (jsonData && jsonData.code === 500) {
                    showAlert('Configuration save failed!', 'error');
                } else {
                    showAlert(`Configuration save completed, response code: ${jsonData ? jsonData.code : 'unknown'}`, jsonData && jsonData.code === 200 ? 'success' : 'warning');
                }
                
            } catch (error) {
                console.error('Failed to save configuration:', error);
                showAlert(`Failed to save configuration: ${error.message}`, 'error');
            } finally {
                saveConfigBtn.innerHTML = originalText;
                saveConfigBtn.classList.remove('btn-loading');
                saveConfigBtn.disabled = false;
            }
        }
        
        // Edit configuration item
        function editConfig(index) {
            const config = configData[currentService][index];
            configName.value = config.name;
            configPath.value = config.path;
            
            // Delete original configuration item
            configData[currentService].splice(index, 1);
            
            // Reload list
            displayConfigList();
            
            showAlert(`Editing configuration item "${config.name}"`, 'success');
        }
        
        // Delete configuration item
        function deleteConfig(index) {
            const config = configData[currentService][index];
            if (confirm(`Are you sure you want to delete configuration item "${config.name}"?`)) {
                configData[currentService].splice(index, 1);
                saveData();
                displayConfigList();
                showAlert(`Configuration item "${config.name}" deleted`, 'success');
            }
        }
        
        // Format XML
        function formatXML() {
            const xmlString = xmlInput.value.trim();
            
            if (!xmlString) {
                xmlPreview.innerHTML = '';
                xmlPreview.appendChild(emptyXml);
                return;
            }
            
            try {
                // Use DOMParser to parse XML
                const parser = new DOMParser();
                xmlDoc = parser.parseFromString(xmlString, "text/xml");
                
                // Check if XML parsing has errors
                const parserError = xmlDoc.getElementsByTagName("parsererror");
                if (parserError.length > 0) {
                    throw new Error("XML parsing error: " + parserError[0].textContent);
                }
                
                // Clear previous node mapping
                xmlNodesMap.clear();
                
                // Format and display XML
                const formattedXml = formatXmlWithXPath(xmlDoc.documentElement, 0);
                displayFormattedXml(formattedXml);
            } catch (e) {
                showAlert('XML format error: ' + e.message, 'error');
                console.error(e);
            }
        }
        
        // Format XML and generate XPath
        function formatXmlWithXPath(node, indentLevel) {
            if (!node) return '';
            
            const indent = '  '.repeat(indentLevel);
            let result = '';
            
            // Process different node types
            if (node.nodeType === Node.ELEMENT_NODE) {
                // Element node
                const nodeId = `node-${currentLineId++}`;
                xmlNodesMap.set(nodeId, node);
                
                // Start tag
                let tagStart = `${indent}&lt;<span class="tag clickable" data-node-id="${nodeId}">${node.nodeName}</span>`;
                
                // Add attributes
                if (node.attributes && node.attributes.length > 0) {
                    for (let i = 0; i < node.attributes.length; i++) {
                        const attr = node.attributes[i];
                        const attrId = `attr-${currentLineId++}`;
                        xmlNodesMap.set(attrId, attr);
                        
                        tagStart += ` <span class="attr-name clickable" data-node-id="${attrId}">${attr.name}</span>=&quot;<span class="attr-value clickable" data-node-id="${attrId}">${attr.value}</span>&quot;`;
                    }
                }
                
                // Check if has child nodes
                const hasChildNodes = node.childNodes.length > 0;
                const hasOnlyTextChild = node.childNodes.length === 1 && node.childNodes[0].nodeType === Node.TEXT_NODE;
                
                if (!hasChildNodes) {
                    // Self-closing tag
                    result += `${tagStart}/&gt;\n`;
                } else if (hasOnlyTextChild) {
                    // Only text child node
                    const textNode = node.childNodes[0];
                    const textId = `text-${currentLineId++}`;
                    xmlNodesMap.set(textId, textNode);
                    
                    const textContent = textNode.textContent.trim();
                    result += `${tagStart}&gt;<span class="text clickable" data-node-id="${textId}">${escapeHtml(textContent)}</span>&lt;/<span class="tag clickable" data-node-id="${nodeId}">${node.nodeName}</span>&gt;\n`;
                } else {
                    // Multiple child nodes
                    result += `${tagStart}&gt;\n`;
                    
                    // Process child nodes
                    for (let i = 0; i < node.childNodes.length; i++) {
                        const child = node.childNodes[i];
                        result += formatXmlWithXPath(child, indentLevel + 1);
                    }
                    
                    // End tag
                    result += `${indent}&lt;/<span class="tag clickable" data-node-id="${nodeId}">${node.nodeName}</span>&gt;\n`;
                }
            } else if (node.nodeType === Node.TEXT_NODE) {
                // Text node
                const text = node.textContent.trim();
                if (text) {
                    const textId = `text-${currentLineId++}`;
                    xmlNodesMap.set(textId, node);
                    result += `${indent}<span class="text clickable" data-node-id="${textId}">${escapeHtml(text)}</span>\n`;
                }
            } else if (node.nodeType === Node.COMMENT_NODE) {
                // Comment node
                const commentId = `comment-${currentLineId++}`;
                xmlNodesMap.set(commentId, node);
                result += `${indent}&lt;!--<span class="comment clickable" data-node-id="${commentId}">${node.textContent}</span>--&gt;\n`;
            }
            
            return result;
        }
        
        // Display formatted XML
        function displayFormattedXml(formattedXml) {
            xmlPreview.innerHTML = '';
            
            if (!formattedXml || formattedXml.trim() === '') {
                xmlPreview.appendChild(emptyXml);
                return;
            }
            
            // Create line container
            const lines = formattedXml.split('\n');
            lines.forEach((line, index) => {
                if (line.trim() === '') return;
                
                const lineElement = document.createElement('div');
                lineElement.className = 'xml-line';
                lineElement.innerHTML = line;
                
                // Add events to clickable elements
                const clickableElements = lineElement.querySelectorAll('.clickable');
                clickableElements.forEach(el => {
                    el.addEventListener('click', function(e) {
                        e.stopPropagation();
                        
                        // Remove previously selected node
                        if (selectedNode) {
                            selectedNode.classList.remove('selected');
                        }
                        
                        // Set current selected node
                        this.classList.add('selected');
                        selectedNode = this;
                        
                        // Get node ID
                        const nodeId = this.getAttribute('data-node-id');
                        if (!nodeId) return;
                        
                        // Get node object
                        const node = xmlNodesMap.get(nodeId);
                        if (!node) return;
                        
                        // Get XPath
                        const xpath = getXPathForNode(node);
                        selectedXPath = xpath;
                        selectedXPathInput.value = xpath;
                        applyXPathBtn.disabled = false;
                        
                        // Get node information
                        let nodeInfo = '';
                        if (node.nodeType === Node.ELEMENT_NODE) {
                            nodeInfo = `Element node: ${node.nodeName}`;
                        } else if (node.nodeType === Node.ATTRIBUTE_NODE) {
                            nodeInfo = `Attribute node: ${node.name} = "${node.value}"`;
                        } else if (node.nodeType === Node.TEXT_NODE) {
                            nodeInfo = `Text node: "${node.textContent.trim()}"`;
                        } else if (node.nodeType === Node.COMMENT_NODE) {
                            nodeInfo = `Comment node: "${node.textContent}"`;
                        }
                        
                        nodeInfoDiv.textContent = nodeInfo;
                        showAlert(`Selected XPath: ${xpath}`, 'success');
                    });
                });
                
                xmlPreview.appendChild(lineElement);
            });
        }
        
        // Get XPath for node
        function getXPathForNode(node) {
            if (!node) return '';
            
            // If attribute node
            if (node.nodeType === Node.ATTRIBUTE_NODE) {
                const elementPath = getXPathForNode(node.ownerElement);
                return elementPath + '/@' + node.name;
            }
            
            // If text node
            if (node.nodeType === Node.TEXT_NODE) {
                const elementPath = getXPathForNode(node.parentNode);
                return elementPath + '/text()';
            }
            
            // If comment node
            if (node.nodeType === Node.COMMENT_NODE) {
                const elementPath = getXPathForNode(node.parentNode);
                return elementPath + '/comment()';
            }
            
            // Process element node
            const parts = [];
            let currentNode = node;
            
            while (currentNode && currentNode.nodeType === Node.ELEMENT_NODE) {
                let index = 0;
                let sibling = currentNode.previousSibling;
                
                // Calculate index of same tag name among siblings
                while (sibling) {
                    if (sibling.nodeType === Node.ELEMENT_NODE && sibling.nodeName === currentNode.nodeName) {
                        index++;
                    }
                    sibling = sibling.previousSibling;
                }
                
                const tagName = currentNode.nodeName;
                const nodeIndex = index > 0 ? `[${index + 1}]` : '';
                parts.unshift(tagName + nodeIndex);
                
                currentNode = currentNode.parentNode;
            }
            
            return '/' + parts.join('/');
        }
        
        // HTML escape
        function escapeHtml(text) {
            const div = document.createElement('div');
            div.textContent = text;
            return div.innerHTML;
        }
        
        // Show alert message
        function showAlert(message, type) {
            if (type === 'error') {
                errorMessage.textContent = message;
                errorAlert.style.display = 'block';
                successAlert.style.display = 'none';
                infoAlert.style.display = 'none';
                warningAlert.style.display = 'none';
                
                // Auto hide after 3 seconds
                setTimeout(() => {
                    errorAlert.style.display = 'none';
                }, 3000);
            } else if (type === 'success') {
                successMessage.textContent = message;
                successAlert.style.display = 'block';
                errorAlert.style.display = 'none';
                infoAlert.style.display = 'none';
                warningAlert.style.display = 'none';
                
                // Auto hide after 3 seconds
                setTimeout(() => {
                    successAlert.style.display = 'none';
                }, 3000);
            } else if (type === 'info') {
                infoMessage.textContent = message;
                infoAlert.style.display = 'block';
                successAlert.style.display = 'none';
                errorAlert.style.display = 'none';
                warningAlert.style.display = 'none';
                
                // Auto hide after 3 seconds
                setTimeout(() => {
                    infoAlert.style.display = 'none';
                }, 3000);
            } else if (type === 'warning') {
                warningMessage.textContent = message;
                warningAlert.style.display = 'block';
                successAlert.style.display = 'none';
                errorAlert.style.display = 'none';
                infoAlert.style.display = 'none';
                
                // Auto hide after 3 seconds
                setTimeout(() => {
                    warningAlert.style.display = 'none';
                }, 3000);
            }
        }
        
        // Save data to localStorage
        function saveData() {
            localStorage.setItem('searchtable-config', JSON.stringify(configData));
        }
        
        // Load data from localStorage
        function loadData() {
            const savedData = localStorage.getItem('searchtable-config');
            if (savedData) {
                const parsedData = JSON.parse(savedData);
                Object.keys(parsedData).forEach(key => {
                    configData[key] = parsedData[key];
                });
            }
        }
    </script>
</body>
</html>

	
	>
	quit $$$OK
}

}
