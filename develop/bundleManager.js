"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var fs = require("fs");
var path = require("path");
var child_process_1 = require("child_process");
var utils_1 = require("./utils");

var BundleManager = /** @class */ (function () {
    function BundleManager(_bundlePath, _nodeOptions, _preview) {
        if (_bundlePath === void 0) { _bundlePath = BundleManager.defaultBundlePath; }
        this._bundlePath = _bundlePath;
        this._nodeOptions = _nodeOptions;
        this._preview = _preview;
        if (_preview) {
            this._preview = '--preview';
        }
    }

    BundleManager.prototype.invokeBundle = function (args) {
        var _this = this;

        if (!fs.existsSync(this._bundlePath)) {
            utils_1.printToConsole("Bundle file not found: " + this._bundlePath);
            return;
        }

        var escapedBundleFilePath = utils_1.escapeArgIfNeeded(this._bundlePath);
        var argsToInsert = args.join(' ');

        utils_1.printToConsole('Executing bundle...');
        if (this._nodeOptions) {
            utils_1.printToConsole("Using the following node options: " + this._nodeOptions);
        }
        if (this._preview) {
            utils_1.printToConsole("Using the option: " + this._preview);
        }
        utils_1.printToConsole("Inserting the following arguments: " + argsToInsert);

        var execCommand = ['node', this._nodeOptions, escapedBundleFilePath, argsToInsert, this._preview].join(' ');
        this._execShellCommand(execCommand);
    };

    BundleManager.prototype._execShellCommand = function (cmd) {
        return new Promise(function (resolve) {
            utils_1.printToConsole("Executing bundle file, full command:\n\n" + cmd + "\n\n");
            var bundleProcess = child_process_1.exec(cmd, function (error, stdout) {
                utils_1.printToConsole(stdout);
                if (error) {
                    utils_1.printToConsole("\n=====ERROR=====\n" + error.toString());
                }
                utils_1.printToConsole("Execution finished....");
                resolve();
            });
            bundleProcess.on('close', function (exitCode) {
                if (exitCode !== 0) {
                    throw "Execution failed with exit code: " + exitCode;
                }
            });
        });
    };

    BundleManager.defaultBundlePath = path.join(process.cwd(), 'downloads', 'main.js');

    return BundleManager;
}());

exports.BundleManager = BundleManager;
