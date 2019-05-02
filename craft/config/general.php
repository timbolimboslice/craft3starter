<?php
/**
 * General Configuration
 *
 * All of your system's general configuration settings go in here. You can see a
 * list of the available settings in vendor/craftcms/cms/src/config/GeneralConfig.php.
 *
 * @see \craft\config\GeneralConfig
 */

return [
    // Global settings
    '*' => [
        // Default Week Start Day (0 = Sunday, 1 = Monday...)
        'defaultWeekStartDay' => 0,

        // Whether generated URLs should omit "index.php"
        'omitScriptNameInUrls' => true,

        // Control Panel trigger word
        'cpTrigger' => 'admin',

        // The secure key Craft will use for hashing and encrypting data
        'securityKey' => getenv('SECURITY_KEY'),

        // Whether to save the project config out to config/project.yaml
        // (see https://docs.craftcms.com/v3/project-config.html)
        'useProjectConfigFile' => true,

        'aliases' => [
            '@baseUrl' => getenv('BASE_URL'),
            '@basePath' => getenv('BASE_PATH'),
        ],

        'generateTransformsBeforePageLoad' => true,
        'siteUrl' => getenv('SITE_URL'),
        'siteName' => getenv('SITE_NAME'),
        'systemEmailAddress' => getenv('SYSTEM_EMAIL_ADDRESS')
    ],

    // Dev environment settings
    'dev' => [
        'devMode' => true,
        'backupCommand' => getenv('BACKUP_COMMAND'),
        'restoreCommand' => getenv('RESTORE_COMMAND')
    ],

    // Staging environment settings
    'staging' => [
        'devMode' => true
    ],

    // Production environment settings
    'production' => [
        'devMode' => false
    ],
];
