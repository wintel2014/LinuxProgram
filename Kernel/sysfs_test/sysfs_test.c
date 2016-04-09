#include <linux/module.h>
#include <asm/uaccess.h>
#include <linux/version.h>
#include <linux/io.h>
#include <linux/kobject.h>
#include <linux/string.h>

struct kobject *kobj;
static char file_content[100];
static const char* root_dir="sysfs_jiazi";

static ssize_t sys_show(struct kobject *kobj, struct kobj_attribute *attr,char *buf )
{
    strcpy(buf,"sysfs_test\n");
	return strlen(buf);
}
static ssize_t sys_store(struct kobject *kobj,struct kobj_attribute *attr,const char* buf, size_t n)
{
   
    char *p;
	int len;
	p = memchr(buf, '\n', n);
	len = p ? p-buf : n; 
    printk(KERN_INFO "%s:enter\n",__func__);
    strncpy(file_content,buf,len);
    file_content[len]='\0'; 
    printk("%s:: %s --jiazi\n",__func__,file_content);

    return len ;
}
//具体属性参数
static struct kobj_attribute  kobj_attr ={
    .attr = {
        .name =  __stringify(ledstate), //把ledstate转换成字符串
        .mode = 0666, //表示此属性可读可写
     },
    .show = sys_show, //对应读
    .store= sys_store, //对应写

};
//属性数组
static struct attribute *attr_g[] ={
    &kobj_attr.attr,
    NULL,// 必须包含NULL
};
//对属性数组的封装。
static struct attribute_group grp ={
    .attrs = attr_g,
};
    
static int __init led_init(void)
{

    memset(file_content,0,sizeof(file_content));    
    kobj = kobject_create_and_add(root_dir,NULL);
    if(!kobj )
    {
        printk(KERN_INFO "kobject don't create \n");
        return -ENOMEM;
    }
    printk("Please find the dir /sys/sysfs_jiazi/\n");
   return  sysfs_create_group(kobj, &grp);

}
static void __exit led_exit(void)
{
   printk(KERN_INFO "%s:enter\n",__func__);
   sysfs_remove_group(kobj, &grp);
   kobject_del(kobj);
}


module_init(led_init);
module_exit(led_exit);
MODULE_LICENSE("GPL");

