<?php
class Page extends BasePage {

    private static $db = array(
    );

    public function getCMSFields() {
        $fields = parent::getCMSFields();
        return $fields;
    }
}
class Page_Controller extends BasePage_Controller {
    private static $allowed_actions = array (
    );

    public function init() {
        parent::init();
        // print $this->getRequest()->getURL();
    }
}
